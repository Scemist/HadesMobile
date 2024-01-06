import 'package:digi_bloc/models/note.dart';

abstract class NoteState {
  final List<Note> notes;
  NoteState({required this.notes});
}

class NoteInitialState extends NoteState {
  NoteInitialState() : super(notes: []);
}

class NoteLoadingState extends NoteState {
  NoteLoadingState() : super(notes: []);
}

class NoteCurrentState extends NoteState {
  NoteCurrentState({required super.notes});
}

class NoteErrorState extends NoteState {
  final Exception exception;
  NoteErrorState({required this.exception}) : super(notes: []);
}
