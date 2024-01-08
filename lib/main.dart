import 'package:digi_bloc/views/components/main_bottom_navigation_bar.dart';
import 'package:digi_bloc/views/components/main_drawer.dart';
import 'package:digi_bloc/views/pages/notes_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hades',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: const Padding(
          padding: EdgeInsets.all(14),
          child: NotesPage(title: 'Note List'),
        ),
        appBar: AppBar(
          title: const Wrap(
            spacing: 10,
            children: [Icon(LucideIcons.bookLock), Text('Hades')],
          ),
          backgroundColor: Colors.black45,
          foregroundColor: const Color.fromARGB(255, 236, 232, 232),
        ),
        endDrawer: const MainDrawer(),
        backgroundColor: const Color.fromARGB(255, 38, 42, 56),
        bottomNavigationBar: const MainBottomNavigationBar(),
      ),
    );
  }
}
