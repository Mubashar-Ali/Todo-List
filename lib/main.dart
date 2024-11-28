import 'package:flutter/material.dart';
import 'package:todo_list/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
            // bodyMedium: TextStyle(color: Colors.white),
            // bodyLarge: TextStyle(color: Colors.white),
            // titleLarge: TextStyle(color: Colors.white),
            ),
      ),
      home: const App(),
    );
  }
}
