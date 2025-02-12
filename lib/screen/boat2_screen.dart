import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Use latlong2 package

class Boat2Screen extends StatelessWidget {
  const Boat2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boat 1 Details'),
      ),
      body: Column(
        children: [
          // Map widget
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(11.068627, 77.094193), // Set the center to the marker's location
                zoom: 15.0, // Zoom level, adjusted to be closer to the marker
              ),
              nonRotatedChildren: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(11.068627, 77.094193), // Coordinates for the marker
                      builder: (ctx) => const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Details text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Details for Boat 1',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
