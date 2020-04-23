import 'package:flutter/material.dart';

enum NoteMode {
  Editing,
  Adding
}

class Note extends StatelessWidget {
  
  final NoteMode noteMode;
  Note(this.noteMode);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          noteMode == NoteMode.Adding ? 'Add Note': 'Edit Note'
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Title'
              ),
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Text'
              ),
            ),
            Container(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NoteButton('Save', Colors.green, () {
                  Navigator.pop(context);
                }),
                NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                noteMode == NoteMode.Editing ?
                NoteButton('Delete', Colors.red, () {
                  Navigator.pop(context);
                }) : Container(),
            ],)
          ],
        ),
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  NoteButton(this.text, this.color, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                onPressed: onPressed,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                  ),
                color: color,
                minWidth: 100,
                );
  }
}