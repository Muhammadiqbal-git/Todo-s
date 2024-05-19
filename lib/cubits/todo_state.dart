part of 'todo_cubit.dart';

abstract class TodoState{
}

class TodoLoadingState extends TodoState{

}
class TodoDoneState extends TodoState{
  final TodosModel todoList;
  TodoDoneState({required this.todoList});
}
class TodoErrorState extends TodoState{
}