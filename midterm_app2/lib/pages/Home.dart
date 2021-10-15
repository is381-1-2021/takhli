import 'package:flutter/material.dart';
import 'package:midterm_app/models/form_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFF8B82D0),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFF5F478C),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/User.png'),
                  ),
                ),
                Text(
                  'Welcome to Moodish',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF5F478C),
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<FormModel>(
                    builder: (context, model, child) {
                      return Text('Email - ${model.Email}');
                    },
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/1');
                        },
                        child: Container(
                          child: Category(
                            title: 'Log In',
                            png: 'assets/icon.png',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/11');
                        },
                        child: Container(
                          child: Category(
                            title: 'Activities',
                            png: 'assets/DailyActivities.png',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/3');
                        },
                        child: Container(
                          child: Category(
                            title: 'Task Overview',
                            png: 'assets/TaskOverview.png',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/5');
                        },
                        child: Container(
                          child: Category(
                            title: 'Store',
                            png: 'assets/Store.png',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/8');
                        },
                        child: Container(
                          child: Category(
                            title: 'Mood',
                            png: 'assets/DailyMood.png',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/10');
                        },
                        child: Container(
                          child: Category(
                            title: 'Quote',
                            png: 'assets/DailyQuote.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String png;
  final String title;
  const Category({
    Key? key,
    required this.png,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Image.asset(
            png,
            width: 100,
            height: 100,
          ),
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Color(0xFF5F478C),
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
