import 'package:api_case/feature/save_user/cubit/save_user_cubit.dart';
import 'package:api_case/feature/save_user/cubit/save_user_state.dart';
import 'package:api_case/product/model/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveUserPage extends StatelessWidget {
  const SaveUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SaveUserView();
  }
}

class _SaveUserView extends StatefulWidget {
  const _SaveUserView();

  @override
  State<_SaveUserView> createState() => _SaveUserViewState();
}

class _SaveUserViewState extends State<_SaveUserView> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save User'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Name',
                            ),
                            textInputAction: TextInputAction.next,
                            controller: _nameController,
                          ),
                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'Surname',
                            ),
                            controller: _surnameController,
                          ),
                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            controller: _emailController,
                          ),
                          TextField(
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              labelText: 'Age',
                            ),
                            controller: _ageController,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final user = Users(
                                name: _nameController.text,
                                surname: _surnameController.text,
                                email: _emailController.text,
                                age: _ageController.text,
                              );
                              context.read<SaveUserCubit>().saveUser(user);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<SaveUserCubit, SaveUserState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const CircularProgressIndicator();
              }
              if (state.users.isEmpty) {
                return const Text('No users found');
              }
              if (state.users.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      final user = state.users[index];
                      return ListTile(
                        title: Text(user.name ?? ''),
                        subtitle: Text(user.surname ?? ''),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<SaveUserCubit>().deleteUser(user);
                          },
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
