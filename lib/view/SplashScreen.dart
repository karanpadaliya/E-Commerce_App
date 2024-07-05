import 'package:demo/generated/assets.dart';
import 'package:demo/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => Get.toNamed("/HomePage"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SizedBox(
                  height: 400, child: Image.asset(Assets.imagesLoding)),
            ),
            Text("E-commerce",style: TextStyle(fontSize: 30),),
            FloatingActionButton(
              onPressed: () {
                Get.toNamed("/HomePage");
              },
            ),
          ],
        ),
      ),
    );
  }
}
