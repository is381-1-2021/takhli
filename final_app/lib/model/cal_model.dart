import 'package:final_app/pages/data.dart';
import 'package:final_app/pages/history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MathData {
  final String equation;

  MathData(this.equation);

  factory MathData.fromJson(
    Map<String, dynamic> json,
  ) {
    return MathData(
      json['equation'] as String,
    );
  }
}

class AllMathData {
  final List<MathData> mathdata;

  AllMathData(this.mathdata);

  factory AllMathData.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => MathData.fromJson(record)).toList();

    return AllMathData(x);
  }

  factory AllMathData.fromSnapshot(QuerySnapshot snapshot) {
    var x = snapshot.docs.map((record) {
      return MathData.fromJson(record.data() as Map<String, dynamic>);
    }).toList();

    return AllMathData(x);
  }
}

class CalModel extends ChangeNotifier {
  List<MathData> _mathdata = [];

  List<MathData> get getmathdata {
    return _mathdata;
  }

  CalModel() {
    addNewData('History is EMPTY');
  }

  void addNewData(String equation) {
    MathData mathData = MathData(equation);
    _mathdata.add(mathData);
    notifyListeners();
  }
}
