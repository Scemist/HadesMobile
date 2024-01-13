import 'package:hades/blocs/note_bloc.dart';
import 'package:hades/blocs/note_event.dart';
import 'package:hades/blocs/note_state.dart';
import 'package:hades/models/note.dart';
import 'package:hades/views/components/note_tile.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

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
          onPressed: () async {
            _noteBloc.inputNote.add(StoreNote(note: Note(title: 'Olá Mundo')));
          },
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
                        itemBuilder: (context, index) => NoteTile(
                          note: noteList[index],
                          noteBloc: _noteBloc,
                        ),
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
