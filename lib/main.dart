import 'package:hades/blocs/note_bloc.dart';
import 'package:hades/blocs/note_event.dart';
import 'package:hades/blocs/note_state.dart';
import 'package:hades/views/components/main_app_bar.dart';
import 'package:hades/views/components/main_drawer.dart';
import 'package:hades/views/pages/note_page.dart';
import 'package:hades/views/pages/notes_page.dart';
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
  final _noteBloc = NoteBloc();

  @override
  void initState() {
    super.initState();
    _noteBloc.inputNote.add(GetNotes());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NoteState>(
      stream: _noteBloc.outputNote,
      builder: (context, state) {
        return MaterialApp(
          title: 'Hades',
          theme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 45, 83, 206)),
            primaryColor: const Color.fromARGB(255, 45, 83, 206),
            textTheme: Theme.of(
              context,
            ).textTheme.apply(bodyColor: Colors.white),
          ),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(14),
              child: IndexedStack(
                index: currentIndex,
                children: [
                  NotesPage(bloc: _noteBloc, state: state),
                  NotePage(bloc: _noteBloc),
                ],
              ),
            ),
            appBar: const MainAppBar(),
            endDrawer: const MainDrawer(),
            backgroundColor: const Color.fromARGB(255, 38, 42, 56),
            bottomNavigationBar: mainBottomNavigationBar(),
          ),
        );
      },
    );
  }

  BottomNavigationBar mainBottomNavigationBar() {
    return BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 21, 23, 31),
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white60,
            onTap: (index) => setState(() => currentIndex = index),
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
          );
  }
}