import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'locationservice.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final TextEditingController _unitNum = TextEditingController();
  bool _isLoading = false;
  String _locationMessage = "location not set";
  String unitNumber = "Unit Number";
  
  Future<void> _updateLocation() async {
    setState(() => _isLoading = true);

    try {
      Position position = await determinePosition();
      List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);

      setState((){
        _locationMessage = "Address: Block ${placemark[0].street}, ${placemark[0].country} ${placemark[0].postalCode} ";
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
        title: const Text("Delivery"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Icon(Icons.location_on, size: 50, color: Colors.red),

              const SizedBox(height: 20),

              Text(_locationMessage, style: const TextStyle(fontSize: 16)),

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
              
              TextField(
                controller: _unitNum,
                decoration: InputDecoration(
                  labelText: unitNumber,
                  border: const OutlineInputBorder(),
                ),

                onChanged: (value){
                  
                },
              ),
              
              FilledButton(
                onPressed: () {
                  if(_unitNum.text.trim().isEmpty){
                    setState((){
                      unitNumber = "unit number must not be empty";
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(unitNumber))
                    );
                  }
                  else{

                  }
                },
                child: const Text("Set unit number")
              )
            ],
          )
        ]
      )
    );
  }
}