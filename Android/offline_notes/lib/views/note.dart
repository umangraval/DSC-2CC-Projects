import 'package:flutter/material.dart';
import 'package:offline_notes/providers/note_provider.dart';

enum NoteMode {
  Editing,
  Adding
}

class Note extends StatefulWidget {
  
  final NoteMode noteMode;
  final Map<String, dynamic> note;

  Note(this.noteMode, this.note);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  

 @override
  void didChangeDependencies() {
    if(widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _textController.text = widget.note['text'];
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
                   NoteProvider.insertNote({
                     'title':title,
                     'text': text
                   });
                  } else if (widget?.noteMode == NoteMode.Editing) {
                    NoteProvider.updateNote({
                      'id': widget.note['id'],
                      'title': _titleController.text,
                      'text': _textController.text
                    });
                  }
                  Navigator.pop(context);
                }),
                NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                NoteButton('Delete', Colors.red, () async {
                  await NoteProvider.deleteNotes(widget.note['id']);
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