import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../core/design/trip_diagnose_map.dart';

class TripDetailsMapView extends StatefulWidget {
  const TripDetailsMapView({Key? key}) : super(key: key);

  @override
  State<TripDetailsMapView> createState() => _TripDetailsMapViewState();
}

class _TripDetailsMapViewState extends State<TripDetailsMapView> {
  bool _showButton = false;
  double _speed = 0.0;
  int _speedLimitCrossings = 0;
  double _totalDistance = 0.0;
  LatLng? _selectedPosition;
  Duration _totalTime = const Duration();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  StreamSubscription<Position>? _positionStreamSubscription;
  BitmapDescriptor? _markerBitmap;
  final Set<Marker> _markers = {};
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  PolylineResult? _polylineResult;

  @override
  void initState() {
    super.initState();
    getMarker();
     _determinePosition().then((position) {
      _goToMyPosition(position);
    });
    _startLocationTracking();
  }

  void _startLocationTracking() {
    _positionStreamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      _updateCameraPosition(position, context);
    });
  }

  void _stopLocationTracking() {
    _positionStreamSubscription?.cancel();
  }

  void _drawLine() async {
    final Position currentPosition = await Geolocator.getCurrentPosition();
    final LatLng currentLatLng =
        LatLng(currentPosition.latitude, currentPosition.longitude);

    if (_markers.isNotEmpty) {
      final LatLng markerLatLng = _markers.first.position;

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyAsZLJPlAakAJj92D8war4fCCoPqzzA2kU",
        PointLatLng(currentLatLng.latitude, currentLatLng.longitude),
        PointLatLng(markerLatLng.latitude, markerLatLng.longitude),
        travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
        setState(() {
          polylineCoordinates.clear();
          for (var point in result.points) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          }
        });
      }
    }
  }

  Future<void> _goToMyPosition(Position position) async {
    final GoogleMapController controller = await _controller.future;
    final myLocation = LatLng(position.latitude, position.longitude);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(target: myLocation, zoom: 18)),
    );
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId("1"),
        position: myLocation,
        icon: _markerBitmap!,
        infoWindow: const InfoWindow(
          title: 'My Location',
          snippet: 'Default Location',
        ),
      ));
    });
  }

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


  void _updateCameraPosition(Position position, BuildContext context) async {
    final GoogleMapController controller = await _controller.future;
    final myLocation = LatLng(position.latitude, position.longitude);
    // speed limit in in km/h
    const double speedLimit = 80.0;
    // Calculate speed in meters per second
    final double speedInMps = position.speed ?? 0.0;
    // Convert speed to kilometers per hour
    final double speedInKph = speedInMps * 3.6;
    // Declare currentLatLng and currentPosition variables
    final LatLng currentLatLng = LatLng(position.latitude, position.longitude);
    final Position currentPosition = await Geolocator.getCurrentPosition();
    if (speedInKph > speedLimit) {
      setState(() {
        _speedLimitCrossings++;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Speed Limit Exceeded'),
            content: const Text('You have exceeded the speed limit of 50 km/h'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
    if (_markers.isNotEmpty) {
      final LatLng markerLatLng = _markers.first.position;
      final double distance = Geolocator.distanceBetween(
        currentLatLng.latitude,
        currentLatLng.longitude,
        markerLatLng.latitude,
        markerLatLng.longitude,
      );
      final DateTime? currentTimestamp = currentPosition.timestamp;
      final DateTime? positionTimestamp = position.timestamp;
      final Duration time =
          currentTimestamp != null && positionTimestamp != null
              ? currentTimestamp.difference(positionTimestamp)
              : Duration.zero;
      setState(() {
        _totalDistance += distance;
        _totalTime += time;
      });
    }
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
          CameraPosition(target: myLocation, zoom: 18)),
    );
    setState(() {
      _speed = speedInKph;
      _markers.add(Marker(
        markerId: const MarkerId("2"),
        position: myLocation,
        icon: _markerBitmap!,
        infoWindow: const InfoWindow(
          title: 'My Location',
          snippet: 'New Location',
        ),
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
        _updateCameraPosition(position, context);
      },
    );

    return await Geolocator.getCurrentPosition();
  }

  @override
  void dispose() {
    _stopLocationTracking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _markerBitmap == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
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
                      _markers.removeWhere(
                          (marker) => marker.position == _selectedPosition);
                      _markers.add(Marker(
                        markerId: MarkerId(position.toString()),
                        position: position,
                        icon: _markerBitmap!,
                      ));
                      _selectedPosition = position;
                      _showButton = true;
                    });
                  },
                  polylines: {
                    if (_polylineResult != null)
                      Polyline(
                        polylineId: const PolylineId("polyline"),
                        color: Colors.blue,
                        points: polylineCoordinates,
                        width: 3,
                      ),
                  },
                ),
                if (_showButton)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: FloatingActionButton(
                      onPressed: _drawLine,
                      child: const Icon(Icons.directions),
                    ),
                  ),
                SizedBox(
                  height: 70.h,
                  child: TripDiagnoseMapView(
                    totalDeist:
                        "${(_totalDistance / 1000).toStringAsFixed(2)} Km",
                    totalTime:
                        "${_totalTime.inHours} h ${_totalTime.inMinutes.remainder(60)} m",
                    highSpeed: "${_speed.toStringAsFixed(2)} km/h",
                    speedLimitCrossings: _speedLimitCrossings.toString(),
                  ),
                ),
              ],
            ),
    );
  }
}
