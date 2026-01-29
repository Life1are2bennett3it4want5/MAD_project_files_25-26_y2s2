import 'package:flutter/material.dart';

class StaffLogin extends StatefulWidget {
  const StaffLogin({super.key});

  @override
  State<StaffLogin> createState() => _StaffLoginState();
}

class _StaffLoginState extends State<StaffLogin> {
  final TextEditingController _IdController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Center(child: Text("Staff Login", style: TextStyle(fontSize: 25, color: Colors.white,),),),
          const SizedBox(height:20),
          TextField(
            controller: _IdController,
            decoration: const InputDecoration(
              labelText: "Staff ID",
              border: OutlineInputBorder()
            )
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _PasswordController,
            decoration: const InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder()
            )
          ),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () {
              if(_IdController.text.trim().isEmpty || _PasswordController.text.trim().isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please fill up all fields."),
                    backgroundColor: Colors.lightBlue,
                  )
                );
              } else {
                if(_IdController.text.trim() == "OS340!" && _PasswordController.text.trim() == "1234"){
                  Navigator.pushNamed(context, "/ordersummaries");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please fill up all fields."),
                    backgroundColor: Colors.lightBlue,
                  )
                );
                }
              }
            },

            child: const Text(
              "Staff Login",
            )
          ),

          
        ]
      ),
      backgroundColor: const Color.fromARGB(255, 243, 228, 143),
    );
  }
}