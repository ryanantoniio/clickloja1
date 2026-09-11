import 'package:flutter/material.dart';
import '../api/user_api.dart';
import '../domain/user.dart';

class UsersFakeScreen extends StatefulWidget {
  const UsersFakeScreen({super.key});

  @override
  State<UsersFakeScreen> createState() => _UsersFakeScreenState();
}

class _UsersFakeScreenState extends State<UsersFakeScreen> {
  late Future<List<User>> _futureUsers;
  final UserApi _api = UserApi();

  @override
  void initState() {
    super.initState();
    _futureUsers = _api.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários - Fake API'),
      ),
      body: FutureBuilder<List<User>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(user.username),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
