import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const
            IconThemeData(color: Colors.black),
      ),
      body: const Center(
        child: Text('Suas Notificações', style: TextStyle(fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
        ),
        ),
        ),
      );
  }
}