import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Wrap(
        spacing: 10,
        children: [Icon(LucideIcons.bookLock), Text('Hades')],
      ),
      backgroundColor: Colors.black45,
      foregroundColor: const Color.fromARGB(255, 236, 232, 232),
    );
  }
}
