import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_curved_line/maps_curved_line.dart';

class ViewGoogleMapController extends GetxController {
  dynamic u = Get.arguments;
  var startPointName;
  var endPointName;
  var startLat;
  var startLong;
  var endLat;
  var endLong;
  final Set<Polyline> polyLines = {};
  Set<Marker> markers = {};

  Completer<GoogleMapController> mapController = Completer();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startPointName = u[0];
    startLat = u[1];
    startLong = u[2];
    endPointName = u[3];
    endLat = u[4];
    endLong = u[5];
    update();
    fillPolylines();
    print("start name: ${u[1]}");
  }

  fillPolylines() {
    polyLines.add(Polyline(
      polylineId: const PolylineId("line 1"),
      visible: true,
      width: 2,
      //latlng is List<LatLng>
      patterns: [PatternItem.dash(30), PatternItem.gap(10)],
      points: MapsCurvedLines.getPointsOnCurve(
          LatLng(double.parse(startLat), double.parse(startLong)),
          LatLng(double.parse(endLat),
              double.parse(endLong))), // Invoke lib to get curved line points
      color: Colors.blue,
    ));
    update();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);

    markers.add(Marker(
        markerId: const MarkerId('start'),
        position: LatLng(double.parse(startLat), double.parse(startLong)),
        infoWindow: InfoWindow(title: 'Start Point', snippet: startPointName)));
    markers.add(Marker(
        markerId: const MarkerId('end'),
        position: LatLng(double.parse(endLat), double.parse(endLong)),
        infoWindow: InfoWindow(title: 'End Point', snippet: endPointName)));
    update();
  }
}
