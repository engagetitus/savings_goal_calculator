import 'package:flutter/material.dart';

import 'pages/input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none),
          textTheme: const TextTheme(
              displayMedium: TextStyle(color: Colors.deepOrange))),
      home: const Input(),
    );
  }
}
