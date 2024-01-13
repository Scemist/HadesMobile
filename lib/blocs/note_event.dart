import 'package:hades/models/note.dart';

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

class UpdateNote extends NoteEvent {
  final Note note;
  UpdateNote({required this.note});
}
