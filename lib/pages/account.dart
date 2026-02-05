import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _AccountState();
}


//checks if user clicks on sign out button
class _AccountState extends State<Account> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut(); 
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signed out")),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign out failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //sign out button
            if (user != null) ...[
              Text(
                "Signed in as: ${user.email ?? user.uid}",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 200,
                height: 52,
                child: ElevatedButton(
                  onPressed: _signOut,
                  child: const Text("Sign out"),
                ),
              ),
              const SizedBox(height: 24),
            ],
            SizedBox(
              width:200,
              height: 100,
              child: Card(
                color: Colors.orange,
                child: Center(
                  child: GestureDetector(
                    onTap:() => {
                      Navigator.pushNamed(context, "/stafflogin")
                    },

                    child: const Text("Staff Login", style: TextStyle(color: Colors.white, fontSize:25))
                  )
                  
                )
              ),
            ),

            SizedBox(
              width: 200,
              height: 100, 
              child: Card(
                color: Colors.orange,
                child: Center(
                  child: GestureDetector(
                    onTap:(){
                      Navigator.pushNamed(context, "/userlogin");
                    },

                    child: const Text(
                      "User Login",
                      style: TextStyle(color: Colors.white, fontSize: 25)
                                    ),
                  ))
              ),
            )
          ],
        )
      )
    );       
  }
}
