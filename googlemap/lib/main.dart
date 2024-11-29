import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(9.9312, 76.2673);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green[700]),
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Google Map"),
            ),
          ),
          body: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: new Set<Marker>(),
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 11.0))),
    );
  }
}
