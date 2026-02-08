import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'location/locationservice.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Color.fromARGB(172, 90, 63, 32),
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        flexibleSpace: _buildHeaderBanner(),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                  Text(unitNumber,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white)),
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
                      decoration: const InputDecoration(
                        labelStyle: const TextStyle(color: Colors.black),
                        labelText: "Unit number",
                        border: OutlineInputBorder(),
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
                      }
                    },
                    child: const Text("Set unit number"),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

Widget _buildHeaderBanner() {
  return Container(
    height: 120,
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(255, 149, 0, 0.7),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Text(
              "Delivery",
              style: GoogleFonts.notoSans(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}