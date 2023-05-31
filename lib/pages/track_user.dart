import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class TrackUserMap extends StatefulWidget {
  final double userLat;
  final double userLon;

  TrackUserMap({required this.userLat, required this.userLon});

  @override
  _TrackUserMapState createState() => _TrackUserMapState();
}

class _TrackUserMapState extends State<TrackUserMap> {
  GoogleMapController? _controller;
  LatLng? _currentLocation;
  LatLng? _providedLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _providedLocation = LatLng(widget.userLat, widget.userLon);
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  Set<Marker> _createMarkers() {
    final markers = <Marker>{};
    if (_currentLocation != null) {
      markers.add(Marker(
        markerId: MarkerId('currentLocation'),
        position: _currentLocation!,
        icon: BitmapDescriptor.defaultMarker,
      ));
    }
    if (_providedLocation != null) {
      markers.add(Marker(
        markerId: MarkerId('providedLocation'),
        position: _providedLocation!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    }
    return markers;
  }

  Set<Polyline> _createPolylines() {
    final polylines = <Polyline>{};
    if (_currentLocation != null && _providedLocation != null) {
      polylines.add(Polyline(
        polylineId: PolylineId('userRoute'),
        color: Colors.red,
        points: [_currentLocation!, _providedLocation!],
        width: 3,
      ));
    }
    return polylines;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _currentLocation != null
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentLocation!,
                zoom: 14,
              ),
              onMapCreated: (controller) {
                _controller = controller;
              },
              markers: _createMarkers(),
              polylines: _createPolylines(),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
