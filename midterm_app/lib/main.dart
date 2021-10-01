import 'package:flutter/material.dart';
import 'package:midterm_app/Page/DailyActivities.dart';
import 'package:midterm_app/Page/DailyMood.dart';
import 'package:midterm_app/Page/DailyQuote.dart';
import 'package:midterm_app/Page/Home.dart';
import 'package:midterm_app/Page/Store.dart';
import 'package:midterm_app/Page/TaskOverview.dart';
import 'package:provider/provider.dart';

import 'Models/form_model.dart';
import 'Page/LogIn.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FormModel(),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF8B82D0),
        accentColor: Color(0xFF5F478C),
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
        ),
      ),
      initialRoute: '/2',
      routes: {
        '/1': (context) => LogIn(),
        '/2': (context) => Home(),
        '/11': (context) => DailyActivities(),
        '/3': (context) => TaskOverview(),
        '/5': (context) => Store(),
        '/7': (context) => DailyMood(),
        '/9': (context) => DailyQuote(),
      },
    );
  }
}
