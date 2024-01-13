import 'package:hades/blocs/note_bloc.dart';
import 'package:hades/blocs/note_state.dart';
import 'package:hades/views/components/note_tile.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  final NoteBloc bloc;
  final state;
  const NotesPage({super.key, required this.bloc, required this.state});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    final notes = widget.state.data?.notes ?? [];

    if (widget.state.data is NoteLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Expanded(
          child: notes.isNotEmpty
              ? ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) => NoteTile(
                    note: notes[index],
                    noteBloc: widget.bloc,
                  ),
                )
              : const Center(child: Text('Vazio')),
        ),
      ],
    );
  }
}
