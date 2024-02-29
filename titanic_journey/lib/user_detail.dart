import 'package:flutter/material.dart';
import 'package:titanic_journey/users.dart';

final class Userdetail extends StatelessWidget {
  const Userdetail({
    required this.user,
    super.key,
  });

  final Users user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Name: ${user.name}'),
            Text('Surname: ${user.surname}'),
            Text('Team: ${user.team.name}'),
            Text('Age: ${user.age}'),
            Text('Home Town: ${user.homeTown}'),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
    );
  }
}
