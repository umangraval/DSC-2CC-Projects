import 'package:flutter/material.dart';
import 'package:offline_notes/views/note_list.dart';
import 'inherited_widgets/note_inherited_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
          MaterialApp(
        title: 'Notes',
        home: NoteList(),
      ),
    );
  }
}

