import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/task_controller.dart';
import 'package:midterm_app/models/Task.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/models/TaskOperation.dart';
import 'TaskEdit.dart';

// class TodoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("TO DO LIST"),
//       ),
//       body: TodoList(),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => {Navigator.pushNamed(context, "/4")},
//       ),
//     );
//   }
// }

// class TodoList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TodoModel>(
//         builder: (context, todoModel, child) => ListView.builder(
//             padding: const EdgeInsets.all(10.0),
//             itemCount: todoModel.todos.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   padding: EdgeInsets.all(2.0),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFFFD376),
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   height: 150,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.assignment_outlined, size: 30,),
//                           onPressed: () {},
//                         ),
//                         Text(
//                           '${todoModel.todos[index].title}',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ]
//                     ),
//                   ),
//               );
//               }
//             )
//           );
//   }
// }

class AllTask extends StatefulWidget {
  final TaskController controller;

  AllTask({required this.controller});

  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  List<Task> tasks = List.empty();
  bool isLoading = false;

  void initState() {
    super.initState();

    widget.controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getTasks() async {
    var newTasks = await widget.controller.fetchTasks();

    setState(() => tasks = newTasks);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: tasks.isEmpty ? 1 : tasks.length,
          itemBuilder: (ctx, index) {
            if (tasks.isEmpty) {
              return Text('Tap button to fetch tasks');
            }
            return ListTile(
              title: Text(tasks[index].headline),
              subtitle: Text(tasks[index].detail),
            );
          },
        );
  //UI ของมิดเทอม
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: _getTasks,
          //() {
          //  Navigator.pushNamed(context, '/9');
          //},
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        appBar: AppBar(
          title: Text('All your tasks'),
        ),
        body: Center(child: body)
        //Consumer<NotesOperation>(
        //  builder: (context, NotesOperation data, child) {
        //    return ListView.builder(
        //      itemCount: data.getNotes.length,
        //      itemBuilder: (context, index) {
        //        return NotesCard(data.getNotes[index]);
        //      },
        //    );
        //  },
        //),
        );
  }
}
