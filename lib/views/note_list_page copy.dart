import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:hades_mobile/models/note.dart';
import 'package:hades_mobile/views/components/drawer.dart';
import 'package:hades_mobile/views/components/note_list_tile.dart';

class NoteListPage extends StatelessWidget {
  final List<Note> noteList;

  const NoteListPage({super.key, required this.noteList});

  List<NoteListTile> get allNoteListTiles {
    return noteList.map(((note) => NoteListTile(note))).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 42, 56),
      appBar: AppBar(
        title: const Wrap(
          spacing: 10,
          children: [Icon(LucideIcons.bookLock), Text('Hades')],
        ),
        backgroundColor: Colors.black45,
        foregroundColor: const Color.fromARGB(255, 236, 232, 232),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(children: allNoteListTiles),
      ),
      endDrawer: const MainDrawer(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        color: const Color.fromARGB(255, 21, 23, 31),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                LucideIcons.fileStack,
                color: Colors.white,
              ),
              Text('Notas'),
            ]),
            Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                LucideIcons.bookPlus,
                color: Colors.white,
              ),
              Text('Novo'),
            ]),
            Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                LucideIcons.key,
                color: Colors.white,
              ),
              Text('Chave'),
            ]),
            // Column(mainAxisSize: MainAxisSize.min, children: [
            //   Icon(Icons.login, color: Colors.white,),
            //   Text('Login'),
            // ]),
          ],
        ),
      ),
    );
  }
}