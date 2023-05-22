// import '../models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final bool isSelected;

  MapScreen(
      {this.latitude = 37.422,
      this.longitude = -122.084,
      this.isSelected = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    _setthemarker();
  }

  void _setthemarker() {
    _pickedLocation = LatLng(
      widget.latitude,
      widget.longitude,
    );
  }

  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
      print("000000000000000000000000000000000000");
      print(_pickedLocation);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.latitude);
    print(widget.longitude);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select location'),
        actions: [
          if (widget.isSelected)
            IconButton(
                onPressed: _pickedLocation == null
                    ? null
                    : () {
                        Navigator.of(context).pop(_pickedLocation);
                      },
                icon: const Icon(Icons.check))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 16,
        ),
        onTap: widget.isSelected ? _selectLocation : null,
        markers: (_pickedLocation == null && widget.isSelected)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: _pickedLocation ??
                      LatLng(
                        widget.latitude,
                        widget.longitude,
                      ),
                )
              },
      ),
    );
  }
}
