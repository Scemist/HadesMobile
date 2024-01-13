import 'dart:math';

class Note {
  int id;
  String title;
  String body;

  Note({required this.title, this.body = ''}) : id = Random().nextInt(10000);
}
