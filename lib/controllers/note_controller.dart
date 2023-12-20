import 'package:hades_mobile/models/note.dart';
import 'package:hades_mobile/views/note_edit.dart';
import 'package:hades_mobile/views/note_list_page.dart';

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
