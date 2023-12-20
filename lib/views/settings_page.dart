import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text('Hello'),
      ),
      backgroundColor: const Color.fromARGB(255, 38, 42, 56),
      appBar: AppBar(
        title: const Wrap(
          spacing: 10,
          children: [Icon(LucideIcons.settings2), Text('Opções')],
        ),
        backgroundColor: Colors.black45,
        foregroundColor: const Color.fromARGB(255, 236, 232, 232),
      ),
    );
  }
}
