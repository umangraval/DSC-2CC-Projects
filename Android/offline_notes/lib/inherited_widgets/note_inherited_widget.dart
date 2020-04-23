import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {
  
  final notes = [
    {
      'title': 'vitol',
      'text': 'sadgf aias iasdiou opa'
    },
    {
      'title': 'vitacc',
      'text': 'sadgf fdsgias iasdiou opa'
    }
  ];

  NoteInheritedWidget(Widget child) : super(child: child);

  static NoteInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NoteInheritedWidget>();
  }

  @override
  bool updateShouldNotify( NoteInheritedWidget oldWidget) {
    return oldWidget.notes != notes;
  }
}