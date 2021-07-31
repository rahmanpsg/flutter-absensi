import 'dart:async';

import 'package:absensi/services/geolocator_service.dart';
import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();

  // static LatLng _pltuBarruPosition = LatLng(-4.2918978, 119.6294218);
  static LatLng _pltuBarruPosition = LatLng(-3.720254, 119.630227);
  // static LatLng _initialPosition = _pltuBarruPosition;
  static LatLng _initialPosition = LatLng(-3.7192419, 119.6290892);

  Set<Circle> circles = Set.from([
    Circle(
      circleId: CircleId('pltuBarru'),
      center: _pltuBarruPosition,
      radius: 50,
      fillColor: Color(0xff2271cce7),
      strokeColor: primaryColor,
      strokeWidth: 3,
    )
  ]);

  Set<Marker> markers = Set.from([
    Marker(
      markerId: MarkerId('myPosition'),
      position: _initialPosition,
      infoWindow: InfoWindow(
        title: 'Lokasi Anda',
        snippet: '${_initialPosition.latitude}, ${_initialPosition.longitude}',
      ),
    )
  ]);

  // @override
  // void initState() {
  //   super.initState();
  //   GeolocatorService().getLocation().then((position) {
  //     print(position);
  //     LatLng pos = LatLng(position.latitude, position.longitude);
  //     // print(GeolocatorService().inRadius(pos, _pltuBarruPosition));
  //     setState(() {
  //       _initialPosition = pos;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();

    print('--------halooo');
    print(GeolocatorService().inRadius(_initialPosition, _pltuBarruPosition));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 14.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      circles: circles,
      markers: markers,
      // myLocationEnabled: true,
      // myLocationButtonEnabled: true,
    );
  }
}
