import 'dart:async';
import 'package:final_app/model/cal_model.dart';
import 'package:final_app/services/services.dart';

class CalController {
  final Services services;
  List<MathData> mathdata = List.empty();

  StreamController<bool> onSynceController = StreamController();
  Stream<bool> get onSync => onSynceController.stream;

  CalController(this.services);

  Future<List<MathData>> fetchmathdata() async {
    onSynceController.add(true);
    mathdata = await services.getmathdata();
    onSynceController.add(false);

    return mathdata;
  }
}
