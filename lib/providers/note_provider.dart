import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hades/models/note.dart';

class NoteProvider {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<List<Note>> get all async {
    var notes = await storage.read(key: 'notes') ?? '[]';
    List noteList = jsonDecode(notes);

    print(notes);

    return noteList
        .map<Note>((note) => Note(
              title: note['title'],
              body: note['body'],
              id: note['id'],
            ))
        .toList();
  }

  Future<List<Note>> store({required Note note}) async {
    var noteJson = await storage.read(key: 'notes') ?? '[]';
    List notes = jsonDecode(noteJson);

    notes.add({
      "title": note.title,
      "body": note.body,
      "id": note.id,
    });

    await storage.write(key: 'notes', value: jsonEncode(notes));

    return all;
  }

  Future<List<Note>> destroy({required Note note}) async {
    var notes = await all;
    notes.remove(note);
    await storage.write(key: 'notes', value: jsonEncode(notes));

    return all;
  }

  Future<List<Note>> update({required Note note}) async {
    var noteJson = await storage.read(key: 'notes') ?? '[]';
    List notes = jsonDecode(noteJson);

    return all;
  }
}
