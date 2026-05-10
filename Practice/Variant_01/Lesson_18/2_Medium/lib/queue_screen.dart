import 'package:flutter/material.dart';
import 'client_row.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key});

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  int _selectedIndex = 0;

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
          ? const Column(
              children: [
                SizedBox(height: 8),
                ClientRow(
                  queueNumber: 1,
                  name: 'Іваненко Іван',
                  status: 'Обслуговується',
                ),
                ClientRow(
                  queueNumber: 2,
                  name: 'Петренко Петро',
                  status: 'Очікує',
                ),
                ClientRow(
                  queueNumber: 3,
                  name: 'Коваленко Олена',
                  status: 'Очікує',
                ),
              ],
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
              onPressed: () {},
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
