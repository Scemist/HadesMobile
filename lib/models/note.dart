import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Note {
  String title;
  String body;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Note({
    required this.title,
    required this.body,
  });

  static Future<List<Note>> get all async {
    const storage = FlutterSecureStorage();
    // storage.write(key: 'notes', value: null);

    var notesString = (await storage.read(key: 'notes')) ??
        '[{"title": "Aloha Moon", "body": "lorem ipppppp"}]';

    print(notesString);

    List notes = jsonDecode(notesString);

    return notes
        .map((note) => Note(title: note['title'], body: note['body']))
        .toList();
  }

  Future<void> store() async {
    var notesString = (await storage.read(key: 'notes')) ?? '[]';
    List notes = jsonDecode(notesString);

    notes.add({
      "title": title,
      "body": body,
    });

    storage.write(key: 'notes', value: jsonEncode(notes));
  }
}
