import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationMap extends StatefulWidget {
  final Function(double, double) onLocationChanged;

  UserLocationMap({required this.onLocationChanged});

  @override
  _UserLocationMapState createState() => _UserLocationMapState();
}

class _UserLocationMapState extends State<UserLocationMap> {
  GoogleMapController? _controller;
  LatLng? _userLocation;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });
    widget.onLocationChanged(position.latitude, position.longitude);
    print(position.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Adjust the width as needed
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add a border around the map
        borderRadius: BorderRadius.circular(8.0), // Add border radius
      ),
      child: _userLocation != null
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _userLocation!,
                zoom: 14,
              ),
              onMapCreated: (controller) {
                _controller = controller;
              },
              markers: {
                Marker(
                  markerId: MarkerId('userLocation'),
                  position: _userLocation!,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                ),
              },
              // Add other map options as needed
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
