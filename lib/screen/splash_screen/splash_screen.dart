import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 8),
      () => Navigator.pushReplacementNamed(context, Routes.home_page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Image.network(
            "https://www.oliverwyman.com/content/dam/oliver-wyman/v2/tmp/education-mobile.gif",
            fit: BoxFit.cover,
          ),
          const Spacer(),
          const LinearProgressIndicator(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
