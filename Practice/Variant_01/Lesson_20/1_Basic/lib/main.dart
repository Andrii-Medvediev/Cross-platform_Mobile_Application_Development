import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'themed_queue_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Електронна черга',
      theme: AppTheme.lightTheme(),
      home: const ThemedQueueScreen(),
    );
  }
}
