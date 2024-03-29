import 'package:hades/blocs/note_event.dart';
import 'package:flutter/material.dart';
import 'package:hades/models/note.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NotePage extends StatefulWidget {
  final note;
  final bloc;

  const NotePage({super.key, this.note, this.bloc});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(
      text: widget.note == null ? '' : widget.note.title,
    );

    _bodyController = TextEditingController(
      text: widget.note == null ? '' : widget.note.body,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(
                hintText: 'Título',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 59, 65, 85),
                prefixIcon: Icon(LucideIcons.book),
                prefixIconColor: Colors.white70),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: TextFormField(
              controller: _bodyController,
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Lorem ipsum...',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 59, 65, 85),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopupMenuButton(
                color: const Color.fromARGB(255, 132, 137, 155),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(LucideIcons.chevronUp),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      if (widget.note != null) {
                        widget.bloc.inputNote.add(
                          DestroyNote(note: widget.note),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Row(
                      children: [
                        Icon(
                          LucideIcons.trash,
                          color: Color.fromARGB(255, 116, 52, 47),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Mover para a Lixeira',
                          style: TextStyle(
                            color: Color.fromARGB(255, 116, 52, 47),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (widget.note != null) {
                    widget.note.title = _titleController.text;
                    widget.note.body = _bodyController.text;
                    widget.bloc.inputNote.add(UpdateNote(note: widget.note));
                  } else {
                    widget.bloc.inputNote.add(
                      StoreNote(
                        note: Note(
                          title: _titleController.text,
                          body: _bodyController.text,
                        ),
                      ),
                    );
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 49, 70, 138),
                  ),
                  // shape:
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: Wrap(
                    spacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(LucideIcons.save, color: Colors.white),
                      Text('Salvar', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );

    if (widget.note != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Wrap(
            spacing: 10,
            children: [Icon(LucideIcons.bookLock), Text('Hades')],
          ),
          backgroundColor: Colors.black45,
          foregroundColor: const Color.fromARGB(255, 236, 232, 232),
        ),
        backgroundColor: const Color.fromARGB(255, 38, 42, 56),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: body,
        ),
      );
    } else {
      return body;
    }
  }
}
