import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/views/tasks/tasks_cubit.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(),
      child: BlocConsumer<TasksCubit, TasksState>(
        builder: (context, state) {
          if (state is TasksLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.lightBlue),
            );
          } else if (state is TasksSuccess) {
            return ListView.builder(
              itemCount: context.watch<TasksCubit>().tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                      context.watch<TasksCubit>().tasks[index].id.toString()),
                  title: Text(
                      context.watch<TasksCubit>().tasks[index].title ?? ""),
                  trailing: context.watch<TasksCubit>().tasks[index].completed!
                      ? const Icon(
                          Icons.done,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "Error!",
                style: TextStyle(fontSize: 24),
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is TasksError) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Sorry there is an error!")));
          }
        },
      ),
    );
  }
}
