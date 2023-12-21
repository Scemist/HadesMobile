import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:hades_mobile/models/note.dart';

class NoteListTile extends StatelessWidget {
  final Note note;

  const NoteListTile(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () {},
        title: Text(note.title),
        textColor: Colors.white,
        tileColor: const Color.fromARGB(255, 59, 65, 85),
        leading: const Icon(
          LucideIcons.book,
          color: Color.fromARGB(255, 107, 107, 136),
        ),
        trailing: InkWell(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              LucideIcons.trash,
              color: Color.fromARGB(255, 128, 97, 89),
              size: 15,
            ),
          ),
          onTap: () {
            print('sim');
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
