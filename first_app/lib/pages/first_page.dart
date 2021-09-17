import 'package:flutter/material.dart';

import 'second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? _message = 'Here is where we get value back.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.fingerprint),
            tooltip: 'Button1',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bungalow),
            tooltip: 'Button 2',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('First Page'),
            Text('$_message'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: Text('Go to...'),
            ),
            ElevatedButton(
              onPressed: () async {
                var response = await Navigator.pushNamed(context, '/6');

                setState(() {
                  _message = response.toString();
                });
              },
              child: Text('Please click to fill the form'),
            ),
          ],
        ),
      ),
    );
  }
}
