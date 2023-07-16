import 'package:flutter/material.dart';
import '../../models/tasks_model.dart';
import '../../services/tasks_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<TasksModel> tasks = [];
  bool isLoading = true;

  getTasks() async {
    tasks = await TasksService().getTasksState();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState(){
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading? const Center(
      child: CircularProgressIndicator(color: Colors.blue),
    )
        :ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: Text(tasks[index].id.toString()),
          title: Text(tasks[index].title ?? ""),
          trailing: tasks[index].completed!?
          const Icon(Icons.done, color: Colors.green,)
              :const Icon(Icons.close, color: Colors.red,),
        );
      },
    );
  }
}
