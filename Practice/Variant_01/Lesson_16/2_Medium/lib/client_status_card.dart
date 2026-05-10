import 'package:flutter/material.dart';

class ClientStatusCard extends StatefulWidget {
  final int queueNumber;
  final String name;

  const ClientStatusCard({
    super.key,
    required this.queueNumber,
    required this.name,
  });

  @override
  State<ClientStatusCard> createState() => _ClientStatusCardState();
}

class _ClientStatusCardState extends State<ClientStatusCard> {
  String _status = 'Очікує';

  void _toggleStatus() {
    setState(() {
      _status = _status == 'Очікує' ? 'Обслуговується' : 'Очікує';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          '№${widget.queueNumber}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        title: Text(widget.name),
        subtitle: Text(_status),
        trailing: ElevatedButton(
          onPressed: _toggleStatus,
          style: ElevatedButton.styleFrom(
            backgroundColor: _status == 'Очікує' ? Colors.orange : Colors.green,
          ),
          child: Text(
            _status == 'Очікує' ? 'Прийняти' : 'Завершити',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
