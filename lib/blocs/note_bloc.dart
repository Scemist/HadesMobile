import 'dart:async';
import 'package:digi_bloc/blocs/note_event.dart';
import 'package:digi_bloc/blocs/note_state.dart';
import 'package:digi_bloc/models/note.dart';
import 'package:digi_bloc/providers/note_provider.dart';

class NoteBloc {
  final _repository = NoteProvider();

  final StreamController<NoteEvent> _inputNoteController = StreamController<NoteEvent>();
  Sink<NoteEvent> get inputNote => _inputNoteController.sink;

  final StreamController<NoteState> _outputNoteController = StreamController<NoteState>();
  Stream<NoteState> get outputNote => _outputNoteController.stream;

  NoteBloc() {
    _inputNoteController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(NoteEvent event) async {
    List<Note> notes = [];

    _outputNoteController.add(NoteLoadingState());

    if (event is GetNotes) {
      notes = await _repository.all;
    } else if (event is StoreNote) {
      notes = await _repository.store(note: event.note);
    } else if (event is DestroyNote) {
      notes = await _repository.destroy(note: event.note);
    }

    _outputNoteController.add(NoteCurrentState(notes: notes));
  }
}
