import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  //
  // Future<Position>
  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled == false) {
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return Future.error('Location permissions are denied');
    }
    if (permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition();
      print(position.latitude);
      print(position.longitude);
    }
// AIzaSyBzKFU-TDLRO2kAoHAdgiil4zPw2GrC9OE
    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     return Future.error('Location permissions are denied');
    //   }
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    // }

    // return await Geolocator.getCurrentPosition();
  }

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.4434592, 31.6877141),
    zoom: 7.5,
  );
  List<Marker> markers = [
    const Marker(markerId: MarkerId('1'), position: LatLng(30.3333333, 31.4444444)),
    const Marker(markerId: MarkerId('2'), position: LatLng(30.6666666, 31.6666666)),
    const Marker(markerId: MarkerId('3'), position: LatLng(30.8888888, 31.8888888)),
  ];
// init state
  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: GoogleMap(
        markers: markers.toSet(),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
