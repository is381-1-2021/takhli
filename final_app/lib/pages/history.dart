import 'package:final_app/controllers/cal_controller.dart';
import 'package:final_app/model/cal_model.dart';
import 'package:final_app/pages/calculator.dart';
import 'package:final_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'data.dart';

class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  List<MathData> mathdata = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;

  void initState() {
    super.initState();
    controller = CalController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getmathdata() async {
    var newdata = await controller.fetchmathdata();

    setState(() => mathdata = newdata);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: mathdata.isEmpty ? 1 : mathdata.length,
          itemBuilder: (ctx, index) {
            if (mathdata.isEmpty) {
              return Text('History is EMPTY');
            }
            return Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.cyan.shade700,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(mathdata[index].equation,
                      style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            );
          },
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('History'),
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Navigator.push(
                    context,
                    //  firebase<takhli_final>('equation').clear();
                    MaterialPageRoute(
                      builder: (context) => calculator(),
                    ),
                  );
                }),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _getmathdata,
            ),
          ],
        ),
        body: Center(child: body));
  }
}
//      body: Consumer<CalModel>(
//        builder: (context, CalModel data, child) {
//          return ListView.builder(
//            itemCount: data.getmathdata.length,
//            itemBuilder: (context, index) {
//              return historyList(data.getmathdata[index]);
//            },
//          );
//        },
//      ),
    // body: Center(
    //    child: Column(
    //      mainAxisAlignment: MainAxisAlignment.center,
    //      children: [
    //        Padding(
    //          padding: const EdgeInsets.all(8.0),
    //          child: Consumer<CalModel>(
    //            builder: (context, model, child) {
    //              return Text(' ${mathData.equation}');
    //            },
    //          ),
    //        ),
    //      ],
    //    ),
    //  ),
    //);


//class historyList extends StatelessWidget {
//  final MathData mathData;
//  historyList(this.mathData);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.all(15),
//      padding: EdgeInsets.all(15),
//      height: 120,
//      decoration: BoxDecoration(
//          color: Colors.cyan.shade700, borderRadius: BorderRadius.circular(15)),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: [
//          Text(mathData.equation, style: TextStyle(color: Colors.white)),
//          SizedBox(
//            height: 5,
//          ),
//        ],
//      ),
//    );
//  }
//}
