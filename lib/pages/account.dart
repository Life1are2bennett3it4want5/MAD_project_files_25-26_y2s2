import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Color.fromARGB(172, 90, 63, 32),
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          flexibleSpace: _buildHeaderBanner(),
          backgroundColor: Colors.transparent,
          elevation: 0,
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
              width: 200,
              height: 100,
              child: Card(
                  color: Colors.white,
                  child: Center(
                      child: GestureDetector(
                          onTap: () =>
                              {Navigator.pushNamed(context, "/stafflogin")},
                          child: const Text("Staff Login",
                              style: TextStyle(
                                  color: Color.fromARGB(155, 70, 11, 188),
                                  fontSize: 25))))),
            ),

            SizedBox(
              width: 200,
              height: 100,
              child: Card(
                  color: Colors.white,
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/userlogin");
                    },
                    child: const Text("User Login",
                        style: TextStyle(
                            color: Color.fromARGB(155, 70, 11, 188),
                            fontSize: 25)),
                  ))),
            )
          ],
        )));
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
              "Account",
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