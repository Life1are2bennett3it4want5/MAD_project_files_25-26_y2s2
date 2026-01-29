import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _center = LatLng(1.3112, 103.7781); // Singapore
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    // Restaurant marker with red pin
    _markers.add(
      Marker(
        markerId: const MarkerId('restaurant'),
        position: _center,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {
          // Show popup when user taps the marker
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 250,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Icon(Icons.location_on, size: 40, color: Colors.red),
                        const Text(
                          "OneSoul at Singapore Polytechnic\n Singapore 139651",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Location: FC4, near t16 classrooms",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // close the popup
                            Navigator.pushNamed(context, '/ordermenu');
                          },
                          child: const Text("Dine in here"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurants')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(target: _center, zoom: 15),
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
