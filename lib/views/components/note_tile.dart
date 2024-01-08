import 'package:digi_bloc/blocs/note_bloc.dart';
import 'package:digi_bloc/blocs/note_event.dart';
import 'package:digi_bloc/models/note.dart';
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
    return ListTile(
      title: Text(note.title),
      leading: const Icon(LucideIcons.file),
      trailing: InkWell(
        child: const Icon(LucideIcons.trash),
        onTap: () {
          _noteBloc.inputNote.add(DestroyNote(note: note));
        },
      ),
      onTap: () {
        print('Opening');
      },
    );
  }
}
