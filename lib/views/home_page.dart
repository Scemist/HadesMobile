import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:hades_mobile/controllers/note_controller.dart';
import 'package:hades_mobile/views/components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  late PageController pageController;

  List<Widget> _pagesList = [
    NoteController.all,
    NoteController.create,
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Wrap(
          spacing: 10,
          children: [Icon(LucideIcons.bookLock), Text('Hades')],
        ),
        backgroundColor: Colors.black45,
        foregroundColor: const Color.fromARGB(255, 236, 232, 232),
      ),
      endDrawer: const MainDrawer(),
      body: _pagesList[currentPageIndex],
      backgroundColor: const Color.fromARGB(255, 38, 42, 56),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 21, 23, 31),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: (newPageIndex) {
          setState(() {
            if (newPageIndex == 0) {
              _pagesList = [
                NoteController.all,
                NoteController.create,
              ];
            }
            currentPageIndex = newPageIndex;
          });
        },
        currentIndex: currentPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.fileStack),
            label: 'Notas',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.bookPlus),
            label: 'Escrever',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(LucideIcons.key),
          //   label: 'Chave',
          // ),
        ],
      ),
    );
  }
}
