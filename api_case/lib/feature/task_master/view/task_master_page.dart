import 'package:api_case/feature/task_master/cubit/task_master_cubit.dart';
import 'package:api_case/feature/task_master/cubit/task_master_state.dart';
import 'package:api_case/product/model/task_master.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskMasterPage extends StatelessWidget {
  const TaskMasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskMasterView();
  }
}

class TaskMasterView extends StatefulWidget {
  const TaskMasterView({super.key});

  @override
  State<TaskMasterView> createState() => _TaskMasterViewState();
}

class _TaskMasterViewState extends State<TaskMasterView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _dueDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Master'),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                        TextField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await context.read<TaskMasterCubit>().addTaskMaster(
                                  TaskMaster(
                                    title: _titleController.text,
                                    description: _descriptionController.text,
                                  ),
                                );
                            Navigator.pop(context);
                          },
                          child: const Text('Add Task Master'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<TaskMasterCubit>().addTaskMaster(
      //           TaskMaster(
      //             title: 'Title',
      //             description: 'Description',
      //           ),
      //         );
      //   },
      //   child: const Icon(Icons.refresh),
      // ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TaskMasterCubit, TaskMasterState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.error != null) {
                  return Center(
                    child: Text(state.error!),
                  );
                } else {
                  return ListView.builder(
                    itemCount: state.taskMasters.length,
                    itemBuilder: (context, index) {
                      final taskMaster = state.taskMasters[index];
                      return ListTile(
                        title: Text(taskMaster.title!),
                        subtitle: Text(taskMaster.description!),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context
                                .read<TaskMasterCubit>()
                                .deleteTaskMaster(taskMaster.id!);
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
