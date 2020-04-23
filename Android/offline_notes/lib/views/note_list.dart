import 'package:flutter/material.dart';
import 'note.dart';

class NoteList extends StatelessWidget {
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
              MaterialPageRoute(builder: (context) => Note(NoteMode.Editing))
              );
            },
                      child: Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30, left: 13, right: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    NoteTitle(),
                    Container(height:4),
                    NoteText()
                  ],
                ),
              )
            ),
          );
        }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding))
              );
          },
          child: Icon(Icons.add),
        ),
    );
  }
}

class NoteTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
            'title',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          );
  }
}

class NoteText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    );
  }
}