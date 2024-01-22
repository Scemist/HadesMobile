import 'dart:math';

class Note {
  late int id;
  String title;
  String body;

  Note({required this.title, this.body = '', id}) {
    if (id == null) {
      this.id = Random().nextInt(10000);
    } else {
      this.id = id;
    }
  }
}
