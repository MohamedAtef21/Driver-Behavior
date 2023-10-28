import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripDetailsMapView extends StatefulWidget {
  const TripDetailsMapView({Key? key}) : super(key: key);

  @override
  State<TripDetailsMapView> createState() => _TripDetailsMapViewState();
}

class _TripDetailsMapViewState extends State<TripDetailsMapView> {
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  StreamSubscription<Position>? _positionStreamSubscription;
  BitmapDescriptor? _markerBitmap;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    getMarker();
    _determinePosition().then((position) {
      _goToMyPosition(position);
    });
  }

  Future<void> _goToMyPosition(Position position) async {
    final GoogleMapController controller = await _controller.future;
    final myLocation = LatLng(position.latitude, position.longitude);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(target: myLocation, zoom: 19)),
    );
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("1"),
        position: myLocation,
        icon: _markerBitmap!,
      ));
    });
  }

  Future<void> getMarker() async {
    final ImageConfiguration imageConfiguration = ImageConfiguration();
    final BitmapDescriptor bitmapDescriptor =
        await BitmapDescriptor.fromAssetImage(
      imageConfiguration,
      "assets/images/map_marker.png",
    );
    setState(() {
      _markerBitmap = bitmapDescriptor;
    });
  }

  void _updateCameraPosition(Position position) async {
    final GoogleMapController controller = await _controller.future;
    final myLocation = LatLng(position.latitude, position.longitude);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(target: myLocation, zoom: 19)),
    );
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("1"),
        position: myLocation,
        icon: _markerBitmap!,
      ));
    });
  }

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
    _positionStreamSubscription = Geolocator.getPositionStream().listen(
      (Position position) {
        _updateCameraPosition(position);
      },
    );

    return await Geolocator.getCurrentPosition();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _markerBitmap == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 14.0,
              ),
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onTap: (LatLng position) {
                setState(() {
                  _markers.add(Marker(
                    markerId: MarkerId(position.toString()),
                    position: position,
                    icon: _markerBitmap!,
                  ));
                });
              },
            ),
    );
  }
}
