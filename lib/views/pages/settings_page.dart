import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Wrap(spacing: 10, children: [
          Icon(LucideIcons.settings),
          Text('Configurações'),
        ]),
        backgroundColor: Colors.black45,
        foregroundColor: const Color.fromARGB(255, 236, 232, 232),
      ),
      backgroundColor: const Color.fromARGB(255, 38, 42, 56),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Center(child: Text('Aloha moon!')),
      ),
    );
  }
}
