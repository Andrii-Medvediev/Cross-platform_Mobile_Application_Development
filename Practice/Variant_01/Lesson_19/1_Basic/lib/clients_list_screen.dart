import 'package:flutter/material.dart';

class ClientsListScreen extends StatefulWidget {
  const ClientsListScreen({super.key});

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  final List<Map<String, dynamic>> _clients = [
    {'name': 'Іваненко Іван', 'status': 'Очікує'},
    {'name': 'Петренко Петро', 'status': 'Обслуговується'},
    {'name': 'Коваленко Олена', 'status': 'Очікує'},
    {'name': 'Мельник Андрій', 'status': 'Завершено'},
    {'name': 'Шевченко Марія', 'status': 'Очікує'},
  ];

  void _addClient() {
    setState(() {
      _clients.add({'name': 'Мельник Богдан', 'status': 'Очікує'});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Список клієнтів',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _clients.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: Colors.grey.shade300),
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            leading: const Icon(Icons.person, color: Colors.blue),
            title: Text(
              _clients[index]['name'],
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(_clients[index]['status']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addClient,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
