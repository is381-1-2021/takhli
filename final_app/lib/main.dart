import 'package:final_app/model/cal_model.dart';
import 'package:final_app/pages/calculator.dart';
import 'package:final_app/pages/history.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CalModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        backgroundColor: Colors.cyan.shade900,
        primaryColor: Colors.cyan.shade900,
        accentColor: Colors.black,
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
        ),
      ),
      initialRoute: '/calculator',
      routes: <String, WidgetBuilder>{
        '/calculator': (context) => calculator(),
        '/history': (context) => history(),
      },
    );
  }
}
