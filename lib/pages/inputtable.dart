import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'orderingservice.dart';

class InputTable extends StatefulWidget {
  const InputTable({super.key});

  @override
  State<InputTable> createState() => _InputTableState();
}

class _InputTableState extends State<InputTable> {
  final TextEditingController _tableNumber = TextEditingController();
  String warningMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter Table Number", style: GoogleFonts.firaSansCondensed(fontSize:30, fontWeight: FontWeight.w900, )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _tableNumber,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  labelText: "table number",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(warningMessage, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            FilledButton(
              child: const Text("Add table number"),
              onPressed: (){
                if(_tableNumber.text.trim().isEmpty) {
                  setState(() {
                    warningMessage = "Table number cannot be empty";
                  });
                } else {
                  warningMessage = "";
                  OrderingService.setTable(_tableNumber.text);
                  Navigator.pushNamed(context, "/ordermenu", arguments: _tableNumber.text);
                }
              },
            )
          ],
        )
      )
    );
  }
}