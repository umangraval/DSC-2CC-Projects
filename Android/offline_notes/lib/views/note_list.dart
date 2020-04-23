import 'package:flutter/material.dart';
import 'package:offline_notes/inherited_widgets/note_inherited_widget.dart';
import 'note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {


  List<Map<String, String>> get notes => NoteInheritedWidget.of(context).notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Note(NoteMode.Editing, index))
              );
            },
                      child: Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30, left: 13, right: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    NoteTitle(notes[index]['title']),
                    Container(height:4),
                    NoteText(notes[index]['text'])
                  ],
                ),
              )
            ),
          );
        },
        itemCount: notes.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding, null))
              );
          },
          child: Icon(Icons.add),
        ),
    );
  }
}

class NoteTitle extends StatelessWidget {
  final String _title;

  NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
            _title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          );
  }
}

class NoteText extends StatelessWidget {
  final String _text;

  NoteText(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
                    _text,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    );
  }
}