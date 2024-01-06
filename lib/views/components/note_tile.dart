import 'package:digi_bloc/models/note.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final int id;
  // final Function setNotes;

  const NoteTile({
    super.key,
    required this.title,
    required this.id,
    // required this.setNotes,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: const Icon(LucideIcons.file),
      trailing: InkWell(
        child: const Icon(LucideIcons.trash),
        onTap: () async {
        },
      ),
      onTap: () {
        print(id);
      },
    );
  }
}
