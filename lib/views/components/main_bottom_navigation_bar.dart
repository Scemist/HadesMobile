import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainBottomNavigationBar extends StatelessWidget {  
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 21, 23, 31),
      fixedColor: Colors.white,
      unselectedItemColor: Colors.white60,
      // onTap: () {},
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
