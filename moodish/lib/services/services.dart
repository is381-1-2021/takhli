import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:midterm_app/models/Note.dart';
import 'package:midterm_app/models/Task.dart';

abstract class Services {
  Future<List<Note>> getNotes();
  Future<List<Task>> getTasks();
}

class FirebaseServices extends Services {
  @override
  Future<List<Note>> getNotes() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('moodish_quotes').get();

    var all = AllNotes.fromSnapshot(snapshot);

    return all.notes;
  }

  @override
  Future<List<Task>> getTasks() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('moodish_task').get();

    var all = AllTasks.fromSnapshot(snapshot);

    return all.tasks;
  }
}
