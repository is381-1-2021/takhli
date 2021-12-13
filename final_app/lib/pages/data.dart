//import 'package:cloud_firestore/cloud_firestore.dart';

//class MathData {
//  final String equation;
//
//  MathData(this.equation);
//
//  factory MathData.fromJson(
//    Map<String, dynamic> json,
//  ) {
//    return MathData(
//      json['equation'] as String,
//    );
//  }
//}

//class AllData {
//  final List<equation> equations;
//
//  AllData(this.equations);
//
//  factory AllData.fromJson(
//    List<dynamic> json,
//  ) {
//    var x = json.map((record) => MathData.fromJson(record)).toList();
//
//    return AllData(x);
//  }
//
//  factory AllData.fromSnapshot(QuerySnapshot snapshot) {
//  var x = snapshot.docs.map((record) {
//    return MathData.fromJson(record.data() as Map<String, dynamic>);
//  }).toList();

//  return AllData(x);
  //}
//}
