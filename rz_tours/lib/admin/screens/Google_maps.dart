import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rz_tours/widgets/custom_app_bar.dart';
import 'package:rz_tours/admin/models/location.dart' as location;

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(30.0502, 31.2378);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text("RZ-Tours Location"), backgroundColor: Colors.amber),
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
