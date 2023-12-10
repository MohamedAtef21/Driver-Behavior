import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:google_maps_polyline/google_maps_polyline.dart';

class MapEditView extends StatefulWidget {
  const MapEditView({Key? key}) : super(key: key);

  @override
  State<MapEditView> createState() => _MapEditViewState();
}

class _MapEditViewState extends State<MapEditView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  GoogleMapController? _mapController;
  BitmapDescriptor? _markerBitmap;
  final Set<Marker> _markers = {};
  StreamSubscription<LocationData>? _positionStreamSubscription;
  Location? _location;
  LocationData? _currentLocation;
  final Set<Polyline> polyline ={};
  late List<LatLng> routeCoord;
  GoogleMapsPolyline googleMapPolyline = new GoogleMapsPolyline();


  @override
  void initState() {
    super.initState();
    getMarker();
    _determinePosition().then((position) {
      _goToMyPosition(position);
    });
    _startLocationTracking();
  }

  void _startLocationTracking() async {
    _location = Location();
    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await _location!.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location!.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionStatus = await _location!.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await _location!.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    _positionStreamSubscription = _location!.onLocationChanged.listen(
      (LocationData currentLocation) {
        _currentLocation = currentLocation;
        _updateCameraPosition(currentLocation);
      },
    );
  }

// to go to my current location when i open the map
  Future<void> _goToMyPosition(Position position) async {
    final GoogleMapController controller = await _controller.future;
    final myLocation = LatLng(position.latitude, position.longitude);
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: myLocation, zoom: 18),
      ),
    );
    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: const MarkerId("1"),
        position: myLocation,
        icon: _markerBitmap!,
        infoWindow: const InfoWindow(
          title: 'My Location',
        ),
      ));
    });
  }

// add mark on hold on map
  void _markOnHold(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("2"),
          position: point,
          icon: _markerBitmap!,
          infoWindow: InfoWindow(title: "My Mark"),
        ),
      );
    });
  }

  // to mark my location with a marker from assets
  Future<void> getMarker() async {
    const ImageConfiguration imageConfiguration = ImageConfiguration();
    final BitmapDescriptor bitmapDescriptor =
        await BitmapDescriptor.fromAssetImage(
      imageConfiguration,
      "assets/images/map_marker.png",
    );
    setState(() {
      _markerBitmap = bitmapDescriptor;
    });
  }

  void _updateCameraPosition(LocationData locationData) async {
    final GoogleMapController controller = await _controller.future;
    final myLocation =
        LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0);
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: myLocation, zoom: 18),
      ),
    );

    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: const MarkerId("1"),
        position: myLocation,
        icon: _markerBitmap!,
        infoWindow: const InfoWindow(
          title: 'My Location',
        ),
      ));
    });
  }

// to check the permissions
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _markerBitmap == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              onLongPress: _markOnHold,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 14.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers,
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.compass_calibration),
        onPressed: () {
          _determinePosition().then((position) {
            _goToMyPosition(position);
          });
          setState(() {});
        },
      ),
    );
  }
}
