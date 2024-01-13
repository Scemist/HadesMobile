import 'package:digi_bloc/views/components/main_drawer.dart';
import 'package:digi_bloc/views/pages/note_page.dart';
import 'package:digi_bloc/views/pages/notes_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final screens = const [
    NotesPage(title: 'Note List'),
    NotePage(),
  ];

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
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: IndexedStack(
            index: currentIndex,
            children: screens,
          ),
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 21, 23, 31),
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white60,
          onTap: (index) => setState(() => currentIndex = index ),
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.fileStack),
              label: 'Notas',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.bookPlus),
              label: 'Escrever',
            )
          ],
        ),
      ),
    );
  }
}
