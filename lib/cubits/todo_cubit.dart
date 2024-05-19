import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_porto_2/core/models/todos_model.dart';
import 'package:todos_porto_2/core/services/todo_api.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoLoadingState());
  final TodoAPI _api = TodoAPI();

  getTodoList(int id) async {
    emit(TodoLoadingState());
    try {
      TodosModel data = await _api.getTodoList(id);
      await Future.delayed(Duration(seconds: 2));
      print(data);
      emit(TodoDoneState(todoList: data));
    } catch (e) {
      emit(TodoErrorState());
    }
  }

  updateTodoList(int todoId) async {
    var currentState = state;
    try {
      if (currentState is TodoDoneState) {
        Todos temp = currentState.todoList.todoList
            .firstWhere((element) => element.id == todoId);
        currentState.todoList.todoList
            .removeWhere((element) => element.id == todoId);
        Todos data = await _api.updateTodo(todoId, !temp.completed);
        print(data.completed);
        if (data.completed) {
          currentState.todoList.todoList.insert(0, data);
        } else {
          currentState.todoList.todoList.add(data);
        }
        emit(TodoDoneState(todoList: currentState.todoList));
      }
    } catch (e) {
      emit(TodoErrorState());
    }
  }

  addTodoList(String desc, int id) async {
    var currentState = state;
    try {
      if (currentState is TodoDoneState) {
        Todos data = await _api.addTodo(desc, id);
        currentState.todoList.todoList.add(data);
        emit(TodoDoneState(todoList: currentState.todoList));
      }
    } catch (e) {
      emit(TodoErrorState());
    }
  }
}
