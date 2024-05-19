class TodosModel {
  final List<Todos> todoList;
  final int? total;
  final int skip;
  final int limit;
  TodosModel(
      {required this.todoList,
      required this.total,
      required this.skip,
      required this.limit});
  factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
      todoList: List<Todos>.from(json["todos"].map((x) => Todos.fromJson(x))),
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"]);
  Map<String, dynamic> toJson() => {
        "todos": List<dynamic>.from(todoList.map(
          (x) => x.toJson(),
        ))
      };
}

class Todos {
  final int id;
  final String todo;
  final bool completed;
  final int userId;
  Todos(
      {required this.id,
      required this.todo,
      required this.completed,
      required this.userId});

  factory Todos.fromJson(Map<String, dynamic> json) => Todos(
      id: json["id"],
      todo: json["todo"],
      completed: json["completed"],
      userId: json["userId"]);
  Map<String, dynamic> toJson() =>
      {"id": id, "todo": todo, "completed": completed, "userId": userId};
}
