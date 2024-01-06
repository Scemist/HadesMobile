import 'package:digi_bloc/models/note.dart';

class NoteProvider {
  final List<Note> _notes = [];

  Future<List<Note>> get all {
    _notes.addAll([
      Note(title: 'Teste'),
      Note(title: 'Exemplo'),
      Note(title: 'Sem condição'),
    ]);
    return Future.delayed(const Duration(seconds: 2), () => _notes);
  }

  Future<List<Note>> store({required Note note}) async {
    _notes.add(note);
    return Future.delayed(const Duration(seconds: 2), () => _notes);
  }

  Future<List<Note>> destroy({required Note note}) async {
    _notes.remove(note);
    return Future.delayed(const Duration(seconds: 2), () => _notes);
  }
}
