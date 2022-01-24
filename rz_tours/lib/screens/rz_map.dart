import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RzMap extends StatefulWidget {
  const RzMap({Key? key}) : super(key: key);

  @override
  _RzMapState createState() => _RzMapState();
}

class _RzMapState extends State<RzMap> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(30.0502, 31.2378);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("RZ-Tours Location"),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 30.0),
          markers: Set<Marker>.of(
            <Marker>[
              Marker(
                draggable: true,
                markerId: MarkerId("1"),
                position: _center,
                icon: BitmapDescriptor.defaultMarker,
              )
            ],
          ),
        ),
      ),
    );
  }
}
