import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  @override
  Widget build(BuildContext context) {
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
                  child: Text(
                    "User Login",
                    style: TextStyle(color: Colors.white, fontSize: 25)
                ))
              ),
            )
          ],
        )
      )
    );       
  }
}