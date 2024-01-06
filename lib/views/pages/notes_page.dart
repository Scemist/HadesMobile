import 'dart:math';

import 'package:digi_bloc/blocs/note_bloc.dart';
import 'package:digi_bloc/blocs/note_event.dart';
import 'package:digi_bloc/blocs/note_state.dart';
import 'package:digi_bloc/models/note.dart';
import 'package:digi_bloc/providers/note_provider.dart';
import 'package:digi_bloc/views/components/note_tile.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NotesPage extends StatefulWidget {
  final String title;

  const NotesPage({super.key, required this.title});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late final NoteBloc _noteBloc;

  @override
  void initState() {
    super.initState();
    _noteBloc = NoteBloc();
    _noteBloc.inputNote.add(GetNotes());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {},
          child: const Icon(LucideIcons.plus),
        ),
        Expanded(
          child: StreamBuilder<NoteState>(
            stream: _noteBloc.outputNote,
            builder: (context, state) {
              // context, snapshot
              if (state.data is NoteLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.data is NoteCurrentState) {
                final noteList = state.data?.notes ?? [];

                return noteList.isNotEmpty
                    ? ListView.builder(
                        itemCount: noteList.length,
                        itemBuilder: (context, index) {
                          final note = noteList[index];
                          return NoteTile(title: note.title, id: 1);
                        },
                      )
                    : const Center(child: Text('Vazio'));
              }

              print(state.data);
              return const Center(child: Text('Error'));
            },
          ),
        ),
      ],
    );
  }
}
