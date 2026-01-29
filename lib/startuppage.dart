import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color.fromARGB(255, 96, 228, 199),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(

        body: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            const Image(image: AssetImage("assets/img/StartupImg.jpeg")),
            
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.white,
                height: 120,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 8),
                  child: Text(
                    "Get started with the menu!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/mainpage');
                },
                child: const Text("Continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
