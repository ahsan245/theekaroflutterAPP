import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:theek_karo/google_map/view_map_controller.dart';

class ViewGoogleMap extends StatelessWidget {
  const ViewGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewGoogleMapController>(
      init: ViewGoogleMapController(),
      builder: (map) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: map.u == null
              ? SizedBox()
              : GoogleMap(
                  mapType: MapType.normal,
                  polylines: map.polyLines,
                  markers: map.markers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(double.parse(map.startLat),
                        double.parse(map.startLong)),
                    zoom: 10.0,
                  ),
                  onMapCreated: map.onMapCreated,
                ),
        ),
      ),
    );
  }
}
