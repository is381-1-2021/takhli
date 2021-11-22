import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, '/1');
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8B82D0),
                  fixedSize: Size(260, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, '/14');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8B82D0),
                  fixedSize: Size(260, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
