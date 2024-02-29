import 'package:flutter/material.dart';
import 'package:titanic_journey/search_view_model.dart';
import 'package:titanic_journey/user_detail.dart';
import 'package:titanic_journey/users.dart';

final class CustomDateTableWidget extends StatelessWidget {
  const CustomDateTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final searchViewModel = SearchViewModel();
    return ListenableBuilder(
      listenable: searchViewModel,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Custom Date Table'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _CustomTextField(
                controller: controller,
                onChanged: searchViewModel.search,
              ),
              const _CustomDateTable(),
              if (searchViewModel.searchResults.isEmpty)
                const Text('No results found')
              else
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                    itemCount: searchViewModel.searchResults.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(searchViewModel.searchResults[index].name),
                        subtitle:
                            Text(searchViewModel.searchResults[index].surname),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<Widget>(
                              builder: (context) => Userdetail(
                                user: searchViewModel.searchResults[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _CustomTextField extends StatefulWidget {
  const _CustomTextField({
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

final class _CustomTextFieldState extends State<_CustomTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        onChanged: widget.onChanged,
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

final class _CustomDateTable extends StatelessWidget {
  const _CustomDateTable();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
