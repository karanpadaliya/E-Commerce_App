import 'package:demo/view/HomePage.dart';
import 'package:demo/view/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main(){
  runApp(MainPage());
}
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
         GetPage(name: "/", page: () => SplashScreen()),
         GetPage(name: "/HomePage", page: () => HomePage(),transition: Transition.rightToLeft),
      ],
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return Text("onUnknownRoute");
        },);
      },
    );
  }
}
