import 'package:flutter/material.dart';
import 'client_status_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Електронна черга',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const QueueScreen(),
    );
  }
}

class QueueScreen extends StatelessWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Система обслуговування клієнтів'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ClientStatusCard(queueNumber: 1, name: 'Іваненко Іван'),
            ClientStatusCard(queueNumber: 2, name: 'Петренко Петро'),
            ClientStatusCard(queueNumber: 3, name: 'Коваленко Олена'),
          ],
        ),
      ),
    );
  }
}
