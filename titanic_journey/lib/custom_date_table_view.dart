import 'package:flutter/material.dart';
import 'package:titanic_journey/user_detail.dart';
import 'package:titanic_journey/users.dart';

final class CustomDateTableWidget extends StatelessWidget {
  const CustomDateTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Date Table'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Surname'),
            ),
            DataColumn(
              label: Text('Team'),
            ),
            DataColumn(
              label: Text('Age'),
            ),
            DataColumn(
              label: Text('Home Town'),
            ),
            DataColumn(
              label: Text('Email'),
            ),
          ],
          rows: UsersModelList.users.map((user) {
            return DataRow(
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                    builder: (context) => Userdetail(user: user),
                  ),
                );
              },
              cells: [
                DataCell(Text(user.name)),
                DataCell(Text(user.surname)),
                DataCell(
                  Text(
                    user.team.name,
                  ),
                ),
                DataCell(Text(user.age)),
                DataCell(Text(user.homeTown)),
                DataCell(Text(user.email)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
