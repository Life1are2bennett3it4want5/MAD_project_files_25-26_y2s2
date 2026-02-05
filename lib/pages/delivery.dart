import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'location/locationservice.dart';
import 'servicefile.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final TextEditingController _unitNum = TextEditingController();
  bool _isLoading = false;
  String _locationMessage = "Address location not set";
  String unitNumber = "";

  @override
  void dispose() {
    _unitNum.dispose();
    super.dispose();
  }

  Future<void> _updateLocation() async {
    // Safety check: only signed-in users are allowed to request location permission.
    // Don't allow location access unless the user is signed in.
    if (FirebaseAuth.instance.currentUser == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please sign in to use delivery location."),
          backgroundColor: Colors.lightBlue,
        ),
      );
      Navigator.pushNamed(context, "/userlogin");
      return;
    }

    setState(() => _isLoading = true);

    try {
      // This asks for location permission and gets the current GPS position.
      Position position = await determinePosition();
      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      setState(() {
        // Convert GPS coordinates into a readable address.
        _locationMessage =
            "Address: \nBlock ${placemark[0].street}, \n${placemark[0].country}, \n${placemark[0].postalCode}, \n";
      });

      // Save the selected delivery location so other pages (e.g., DeliveryMapPage / Order page) can read it.
      DeliveryService.setCurrentLocation(
        addressText: _locationMessage,
        latitude: position.latitude,
        longitude: position.longitude,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("location updated")));
    } catch (e) {
      //handle errors
      if (!mounted) return;
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: const Text("Location error"),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("ok"),
                  )
                ]);
          });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 30,
      ),
      body: StreamBuilder<User?>(
        // We listen to auth changes so this page updates immediately after login/logout.
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;

          if (user == null) {
            // Simple "auth gate" UI for delivery.
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.delivery_dining,
                        size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    const Text(
                      "Sign in to use delivery",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "We need you to be logged in before using location services for delivery.",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        // Send user to the login / create account screen.
                        onPressed: () =>
                            Navigator.pushNamed(context, "/userlogin"),
                        child: const Text("Sign in / Create account"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Icon(Icons.location_on, size: 50, color: Colors.red),
                  const SizedBox(height: 20),
                  Text(_locationMessage, style: const TextStyle(fontSize: 16)),
                  Text(unitNumber, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton.icon(
                      onPressed: _updateLocation,
                      icon: const Icon(Icons.my_location),
                      label: const Text("Use current location"),
                    ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _unitNum,
                      decoration: InputDecoration(
                        hintText: "Unit number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade500, width: 1.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      if (_unitNum.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("unit number must not be empty"),
                            backgroundColor: Colors.lightBlue,
                          ),
                        );
                      } else {
                        setState(() => unitNumber =
                            "Unit Number: ${_unitNum.text.toString()} \n");
                        DeliveryService.setUnitNumber(_unitNum.text.trim());
                      }
                    },
                    child: const Text("Set unit number"),
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
