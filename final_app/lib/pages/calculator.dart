import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String result = "0";
  String equation = "";
  String expression = "";
  double memplus = 0;
  double memminus = 0;
  double memrecall = 0;

  String formatString(String s) {
    var d = double.parse(s);
    var b = (d % 1 == 0);
    var n;
    String r;

    if (b) {
      n = d.toInt();
      r = n.toString();
    } else {
      n = d;
      r = n.toStringAsFixed(2);
      var s = r.split('.');
      if (s[1] == "00" || s[1] == "0") {
        r = s[0];
      }
    }
    return r;
  }

  buttonPressed(String value) {
    print(value);
    setState(() {
      if (value == "C") {
        result = "0";
      } else if (value == ".") {
        if (result.contains(".")) {
          return;
        } else {
          result = result + value;
        }
      } else if (value == "=") {
        expression = result.replaceAll("x", "*");
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        dynamic calculate = exp.evaluate(EvaluationType.REAL, cm);

        result = "$calculate";
      } else if (value == "Del") {
        result = result.substring(0, result.length - 1);
        if (result == "") result = "0";
      } else if (value == "+/-") {
        if (result != "-") {
          result = "-" + result;
        } else {
          result = result.substring(1);
        }
      } else if (value == "M+") {
        if (result == "0") {
          result = result;
        }
        memplus += double.parse(result);
      } else if (value == "M-") {
        if (result == "0") {
          result = result;
        }
        memminus -= double.parse(result);
      } else if (value == "MR") {
        memrecall = memplus + memminus;
        if (result == "0") {
          result = formatString(memrecall.toString());
        } else {
          result = result + formatString(memrecall.toString());
        }
      } else if (value == "MC") {
        memplus = memminus = 0;
      } else {
        if (result == "0") {
          result = value;
        } else {
          result = result + value;
        }
        if (value == "CE") {
          result = "0";
        }
      }
    });
  }

  Widget myButton(String buttonLabel) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          //  Map<String, dynamic> data = {
          //    "equation": result,
          //  };
          //  FirebaseFirestore.instance
          //      .collection("takhli_final")
          //      .add(data)
          //      .then((value) => print("New Mathdata Added"))
          //      .catchError((error) => print("Failed to add equation!!"));
          //  Navigator.pop(context);
          buttonPressed(buttonLabel);
          Colors.teal.shade900;
        },
        child: Text(
          buttonLabel,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.cyan.shade900,
        appBar: AppBar(
          backgroundColor: Colors.cyan.shade900,
          title: Text('Calculator'),
          actions: [
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  //  onSaved: (value) {
                  //  _result = value!;
                  //  },
                  //initialValue: context.read<FormModel>().firstName,),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    //color: Color(0xFFFFFFFF)
                  ),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      myButton("MC"),
                      myButton("MR"),
                      myButton("M+"),
                      myButton("M-"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("CE"),
                      myButton("C"),
                      myButton("Del"),
                      myButton("/"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("7"),
                      myButton("8"),
                      myButton("9"),
                      myButton("x"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("4"),
                      myButton("5"),
                      myButton("6"),
                      myButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("1"),
                      myButton("2"),
                      myButton("3"),
                      myButton("+"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("+/-"),
                      myButton("0"),
                      myButton("."),
                      myButton("="),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan.shade900,
                          padding: EdgeInsets.all(20.0),
                          alignment: Alignment.centerRight,
                        ),
                        onPressed: () {
                          Map<String, dynamic> data = {
                            "equation": result,
                          };
                          FirebaseFirestore.instance
                              .collection("takhli_final")
                              .add(data)
                              .then((value) => print("New Mathdata Added"))
                              .catchError(
                                  (error) => print("Failed to add equation!!"));
                          Navigator.pop(context);
                        },
                        child: Text("Save"),
                        //style: ElevatedButton.styleFrom(
                        //  primary: Colors.cyan.shade900,
                        //  textStyle: TextStyle(
                        //   fontSize: 15, fontWeight: FontWeight.bold),
                        //),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
