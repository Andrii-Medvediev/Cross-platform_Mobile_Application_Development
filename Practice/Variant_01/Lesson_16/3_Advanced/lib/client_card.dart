import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  final int queueNumber;
  final String name;
  final String status;

  const ClientCard({
    super.key,
    required this.queueNumber,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          '№$queueNumber',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        title: Text(name),
        subtitle: Text(status),
      ),
    );
  }
}
