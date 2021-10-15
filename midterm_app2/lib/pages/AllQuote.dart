import 'package:flutter/material.dart';
import 'package:midterm_app/models/Note.dart';
import 'package:midterm_app/models/NotesOperation.dart';
import 'package:provider/provider.dart';

class AllQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/9');
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: Text('All your quote'),
      ),
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return ListView.builder(
            itemCount: data.getNotes.length,
            itemBuilder: (context, index) {
              return NotesCard(data.getNotes[index]);
            },
          );
        },
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  final now = DateTime.now();
  final Note note;
  NotesCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 120,
      decoration: BoxDecoration(
          color: Color(0xFFFFC392), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${now.day}' +
                  ' / ' +
                  '${now.month}' +
                  ' / ' +
                  '${now.year}' +
                  ' at ' +
                  '${now.hour} : ${now.minute}',
              style: TextStyle(color: Colors.white)),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                note.quote,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5F478C)),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
