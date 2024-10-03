import 'dart:async';

import 'package:flutter/material.dart';
import 'package:juegos_arq/screens/home/home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState() {
    Timer(const Duration(milliseconds: 3500), () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage())
        );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash.gif'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}