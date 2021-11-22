//import 'package:flutter/material.dart';
//import 'package:midterm_app/pages/Home.dart';
//import 'package:splashscreen/splashscreen.dart';

//class splash extends StatefulWidget {
//  @override
//  Widget build(BuildContext context) {
//    throw UnimplementedError();
//  }
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//      Timer(const Duration(milliseconds: 2000), () {
//        Navigator.pushNamed(
//              context,
//              '/auth',
//            );
//      });
//  }

//  _SplashState createState() => _SplashState();
//}

//class _SplashState extends State<splash> {
//  @override
//  Widget build(BuildContext context) {
//    return SplashScreen(
//        seconds: 3,
//        navigateAfterSeconds: Home(),
//        title: Text(
//          'Moodish',
//          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//        ),
//        image: Image.asset('assets/icon.png'),
//        backgroundColor: Colors.white,
//        styleTextUnderTheLoader: TextStyle(color: Colors.deepPurple),
//        photoSize: 100.0,
//        loaderColor: Colors.pinkAccent);
//  }
//}
