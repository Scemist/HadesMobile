import 'package:digi_bloc/models/note.dart';

abstract class NoteEvent {}

class GetNotes extends NoteEvent {}

class StoreNote extends NoteEvent {
  final Note note;
  StoreNote({required this.note});
}

class DestroyNote extends NoteEvent {
  final Note note;
  DestroyNote({required this.note});
}
