import 'package:flutter/material.dart';
import 'package:teste_flutter_1/models/note.dart';
import 'package:teste_flutter_1/views/components/note_list_tile.dart';

class NoteListPage extends StatefulWidget {
  final Future<List<Note>> noteList;

  const NoteListPage({super.key, required this.noteList});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  List<NoteListTile> allNoteListTiles(notes) {
    return notes.map(((note) => NoteListTile(note))).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.noteList,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Text('Descriptografando...');
        } else {
          print(snapshot.data);
          final List<NoteListTile> notes = snapshot.data
              .map<NoteListTile>((note) => NoteListTile(note))
              .toList();

          return Container(
            padding: const EdgeInsets.all(16),
            child: ListView(children: notes),
          );
        }
      },
    );
  }
}
