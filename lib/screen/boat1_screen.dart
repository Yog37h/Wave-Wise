// boat1_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'location_details_screen.dart';

class Boat1Screen extends StatefulWidget {
  const Boat1Screen({super.key});

  @override
  _Boat1ScreenState createState() => _Boat1ScreenState();
}

class _Boat1ScreenState extends State<Boat1Screen> {
  LatLng userPosition = LatLng(11.069000, 77.095000); // Initial placeholder for user location

  @override
  void initState() {
    super.initState();
    _startLocationUpdates();
  }

  // Function to get the user’s real-time location
  void _startLocationUpdates() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    // Listen to location changes
    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        userPosition = LatLng(position.latitude, position.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Current location',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
        elevation: 4,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Map widget with only the user's current location marker
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: userPosition, // Center the map on the user's location
                zoom: 15.0,
              ),
              nonRotatedChildren: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    // User location marker only
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: userPosition,
                      builder: (ctx) => const Icon(
                        Icons.location_pin,
                        color: Colors.blueAccent,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Full-width location info container with blue theme styling
          Container(
            width: double.infinity,
            color: Colors.blue.shade50,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Current Location',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Latitude: ${userPosition.latitude.toStringAsFixed(6)}\n'
                      'Longitude: ${userPosition.longitude.toStringAsFixed(6)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label: const Text(
                        'Refresh Location',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationDetailsScreen(
                              latitude: userPosition.latitude,
                              longitude: userPosition.longitude,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.info, color: Colors.white),
                      label: const Text(
                        'Fetch Details',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue.shade100,
    );
  }
}
