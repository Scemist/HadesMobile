import 'package:digi_bloc/blocs/note_bloc.dart';
import 'package:digi_bloc/blocs/note_event.dart';
import 'package:digi_bloc/models/note.dart';
import 'package:digi_bloc/views/pages/note_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  final NoteBloc _noteBloc;

  const NoteTile({
    super.key,
    required this.note,
    required noteBloc,
  }) : _noteBloc = noteBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotePage(note: note)),
          );
        },
        title: Text(note.title),
        textColor: Colors.white,
        tileColor: const Color.fromARGB(255, 59, 65, 85),
        leading: const Icon(
          LucideIcons.book,
          color: Color.fromARGB(255, 107, 107, 136),
        ),
        trailing: InkWell(
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              LucideIcons.trash,
              color: Color.fromARGB(255, 128, 97, 89),
              size: 15,
            ),
          ),
          onTap: () {
            _noteBloc.inputNote.add(DestroyNote(note: note));
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
