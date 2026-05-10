import 'package:flutter/material.dart';

class ClientsListScreen extends StatefulWidget {
  const ClientsListScreen({super.key});

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  bool _isGridView = false;

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

  Color _statusColor(String status) {
    switch (status) {
      case 'Обслуговується':
        return Colors.green;
      case 'Завершено':
        return Colors.grey;
      default:
        return Colors.orange;
    }
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: _clients.length,
      itemBuilder: (context, index) {
        return Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person, size: 36, color: Colors.blue),
              const SizedBox(height: 8),
              Text(
                _clients[index]['name'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: _statusColor(
                    _clients[index]['status'],
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _clients[index]['status'],
                  style: TextStyle(
                    fontSize: 11,
                    color: _statusColor(_clients[index]['status']),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.separated(
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
    );
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
        actions: [
          IconButton(
            icon: Icon(
              _isGridView ? Icons.list : Icons.grid_view,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      body: _isGridView ? _buildGridView() : _buildListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addClient,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
