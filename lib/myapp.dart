import 'package:flutter/material.dart';
import 'package:teste_flutter_1/views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hades',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}
