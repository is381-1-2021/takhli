import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/cal_model.dart';

abstract class Services {
  Future<List<MathData>> getmathdata();
}

class FirebaseServices extends Services {
  @override
  Future<List<MathData>> getmathdata() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('takhli_final').get();

    var all = AllMathData.fromSnapshot(snapshot);

    return all.mathdata;
  }
}
