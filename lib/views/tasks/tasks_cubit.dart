import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/tasks_model.dart';
import '../../services/tasks_service.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial()) {
    getTasks();
  }

  List<TasksModel> tasks = [];
  bool isLoading = true;

  getTasks() async {
    emit(TasksLoading());
    try{
      tasks = await TasksService().getTasksState();
      isLoading = false;
      emit(TasksSuccess());
    } catch (error){
      print(error.toString());
      emit(TasksError());
    }
  }
}
