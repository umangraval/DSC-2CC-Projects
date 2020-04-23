import 'package:flutter/material.dart';
import 'package:offline_notes/inherited_widgets/note_inherited_widget.dart';

enum NoteMode {
  Editing,
  Adding
}

class Note extends StatefulWidget {
  
  final NoteMode noteMode;
  final int index;
  Note(this.noteMode, this.index);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

 @override
  void didChangeDependencies() {
    if(widget.noteMode == NoteMode.Editing) {
      _titleController.text = _notes[widget.index]['title'];
      _textController.text = _notes[widget.index]['text'];
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Note': 'Edit Note'
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title'
              ),
            ),
            Container(height: 8),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Text'
              ),
            ),
            Container(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NoteButton('Save', Colors.green, () {
                  final title = _titleController.text;
                    final text = _textController.text;
                  if(widget?.noteMode == NoteMode.Adding) {
                    _notes.add({
                      'title': title,
                      'text': text
                    });
                  } else if (widget?.noteMode == NoteMode.Editing) {
                    _notes[widget.index] = {
                      'title': title,
                      'text': text
                    };
                  }
                  Navigator.pop(context);
                }),
                NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                NoteButton('Delete', Colors.red, () {
                  _notes.removeAt(widget.index);
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