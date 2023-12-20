import 'package:teste_flutter_1/models/note.dart';
import 'package:teste_flutter_1/views/note_edit.dart';
import 'package:teste_flutter_1/views/note_list_page.dart';

class NoteController {
  static NoteListPage get all {
    return NoteListPage(noteList: Note.all);
  }

  static NotePage get create {
    return const NotePage();
  }

  static Future<void> store({
    required String title,
    required String body,
  }) async {
    Note(title: title, body: body).store();
  }
}
