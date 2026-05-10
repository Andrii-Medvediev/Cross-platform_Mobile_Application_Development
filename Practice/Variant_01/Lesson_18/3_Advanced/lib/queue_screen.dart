import 'package:flutter/material.dart';
import 'client_card_stack.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key});

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _clients = [
    {'name': 'Іваненко Іван', 'status': 'Завершено'},
    {'name': 'Петренко Петро', 'status': 'Обслуговується'},
    {'name': 'Коваленко Олена', 'status': 'Очікує'},
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
          'Електронна черга',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _clients.length,
              itemBuilder: (context, index) {
                return ClientCardStack(
                  queueNumber: index + 1,
                  name: _clients[index]['name'],
                  status: _clients[index]['status'],
                );
              },
            )
          : Center(
              child: Text(
                _selectedIndex == 1 ? 'Історія' : 'Профіль',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: _addClient,
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.queue), label: 'Черга'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Історія'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профіль'),
        ],
      ),
    );
  }
}
