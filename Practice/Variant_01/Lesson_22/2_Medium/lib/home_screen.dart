import 'package:flutter/material.dart';
import 'client_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> _clients = const [
    {'name': 'Іваненко Іван', 'queueNumber': 1, 'status': 'Обслужений'},
    {'name': 'Петренко Петро', 'queueNumber': 2, 'status': 'Обслуговується'},
    {'name': 'Коваленко Олена', 'queueNumber': 3, 'status': 'Очікує'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Електронна черга',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _clients.length,
        itemBuilder: (context, index) {
          final client = _clients[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                child: Text(
                  '№${client['queueNumber']}',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              title: Text(
                client['name'],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(client['status']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClientDetailsScreen(
                      clientName: client['name'],
                      queueNumber: client['queueNumber'],
                      status: client['status'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
