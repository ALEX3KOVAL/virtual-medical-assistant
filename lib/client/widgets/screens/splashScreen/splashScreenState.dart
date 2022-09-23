import 'dart:async' show Timer;
import 'dart:ui';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_dialogue_system/client/routes/routes.dart';
import 'splashScreen.dart';
import "../authScreen/authScreen.dart";

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(createRoute(const AuthScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: <Widget>[
            ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: const Image(image: AssetImage('assets/splash.png'), fit: BoxFit.fill)
            ),
            Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 150.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                        child:Text("MDS", style: GoogleFonts.aclonica(fontSize: 30, color: const Color.fromRGBO(41, 171, 135, 1.0), letterSpacing: 1.2, fontWeight: FontWeight.normal))),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}