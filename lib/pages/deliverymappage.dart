import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'servicefile.dart';
import 'nav_index.dart';

class DeliveryMapPage extends StatefulWidget {
  const DeliveryMapPage({super.key});

  @override
  State<DeliveryMapPage> createState() => _MapPageState();
}

class _MapPageState extends State<DeliveryMapPage> {
  static const LatLng _center = LatLng(1.3112, 103.7781); // Singapore
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    // If the user did not set a delivery location yet, send them back to the Delivery tab.
    if (!DeliveryService.hasLocation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navIndex.value = 2; // Delivery tab
        Navigator.pushNamedAndRemoveUntil(context, "/mainpage", (r) => false);
      });
      return;
    }

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
                        const Icon(Icons.location_on,
                            size: 40, color: Colors.red),
                        const Text(
                          "OneSoul at Singapore Polytechnic\n Singapore 139651",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
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
                            // Pass a dummy "table" value so OrderMenuPage doesn't crash on options[5].
                            Navigator.pushNamed(context, '/ordermenu',
                                arguments: "Delivery");
                          },
                          child: const Text("Deliver from here"),
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
    // If we got here without a delivery location, just show an empty page (redirect happens in initState).
    final location = DeliveryService.currentLocation;
    if (location == null || !DeliveryService.hasLocation) {
      return const Scaffold(body: SizedBox.shrink());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Restaurants')),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          GoogleMap(
            initialCameraPosition:
                const CameraPosition(target: _center, zoom: 15),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          // Top overlay card with the selected delivery address (does not clip the map).
          Positioned(
            left: 16,
            right: 16,
            top: 12,
            child: SafeArea(
              bottom: false,
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on, color: Colors.red),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Deliver to",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              location.addressText ?? "",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if ((location.unitNumber ?? "").trim().isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Unit: ${location.unitNumber}",
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
