import 'package:flutter/material.dart';
import 'package:offline_notes/views/note_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      home: NoteList(),
    );
  }
}

