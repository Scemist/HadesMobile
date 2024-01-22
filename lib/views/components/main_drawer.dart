import 'package:flutter/material.dart';
import 'package:hades/views/pages/settings_page.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Menu',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.right,
            ),
            const Divider(color: Color.fromARGB(255, 66, 66, 66), height: 40),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textColor: Colors.white,
                    iconColor: Colors.white70,
                    title: const Text('Sair'),
                    leading: const Icon(LucideIcons.doorOpen),
                    onTap: () {},
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textColor: Colors.white,
                    iconColor: Colors.white70,
                    title: const Text('Mandar Feedback'),
                    leading: const Icon(LucideIcons.messageCircle),
                    onTap: () {},
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textColor: Colors.white,
                    iconColor: Colors.white70,
                    title: const Text('Settings'),
                    leading: const Icon(LucideIcons.settings2),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
