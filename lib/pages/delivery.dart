import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'location/locationservice.dart';

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

  
  Future<void> _updateLocation() async {
    setState(() => _isLoading = true);

    try {
      Position position = await determinePosition();
      List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);

      setState((){
        _locationMessage = "Address: \nBlock ${placemark[0].street}, \n${placemark[0].country}, \n${placemark[0].postalCode}, \n";
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("location updated"))
      );

    } catch(e){
      //handle errors
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
            ]
          );
        }
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 30,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),

              const Icon(Icons.location_on, size: 50, color: Colors.red),

              const SizedBox(height: 20),

              Text(_locationMessage, style: const TextStyle(fontSize: 16)),
              Text(unitNumber, style: const TextStyle(fontSize: 16)),

              const SizedBox(height: 20),

              if(_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton.icon(
                  onPressed: _updateLocation,
                  icon: const Icon(Icons.my_location),
                  label: const Text("Use current location"),
                ),
              
              const SizedBox(height:20),
              
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _unitNum,
                  decoration: const InputDecoration(
                    labelText: "Unit number",
                    border: OutlineInputBorder(),
                  ),

                  onChanged: (value){
                    
                  },
                ),
              ),
              
              FilledButton(
                onPressed: () {
                  if(_unitNum.text.trim().isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("unit number must not be empty"),
                        backgroundColor: Colors.lightBlue,
                      )
                    );
                  }
                  else{
                    setState(() => unitNumber = "Unit Number: ${_unitNum.text.toString()} \n");
                  }
                },
                child: const Text("Set unit number")
              ),

              
            ],
          )
        ]
      )
    );
  }
}