import 'package:dio/dio.dart';
import '../models/tasks_model.dart';

class TasksService {
  String url = "https://jsonplaceholder.typicode.com/todos";
  Future<List<TasksModel>> getTasksState() async {
    List<TasksModel> tasksList = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((jsonElement) {
      TasksModel task = TasksModel.fromJson(jsonElement);
      tasksList.add(task);
    });
    return tasksList;
  }
}
