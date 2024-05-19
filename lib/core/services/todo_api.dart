import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todos_porto_2/core/exceptions/app_exception.dart';
import 'package:todos_porto_2/core/models/todos_model.dart';
import 'package:todos_porto_2/core/services/main_url.dart';

class TodoAPI {
  final MainUrl _mainUrl = MainUrl();
  final Dio _dio = Dio();

  Future<TodosModel> getTodoList(int id) async {
    String url = "${_mainUrl.mainUrl}/todos/user/$id";
    try {
      Response data = await _dio.get(url);
      return TodosModel.fromJson(data.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? "");
    } catch (e) {
      if (e is NetworkException) {
        throw NetworkException(e.message);
      } else {
        throw Exception();
      }
    }
  }

  Future<Todos> updateTodo(int todoId, bool status) async {
    print("update todo");
    String url = "${_mainUrl.mainUrl}/todos/$todoId";
    try {
      Response data =
          await _dio.put(url, data: jsonEncode({'completed': status}));
      return Todos.fromJson(data.data);
    } on DioException catch (e) {
      print(e.response);
      throw NetworkException(e.message ?? "");
    } catch (e) {
      print(e);
      if (e is NetworkException) {
        throw NetworkException(e.message);
      } else {
        throw Exception();
      }
    }
  }

  Future<Todos> addTodo(String todoDesc, int id) async {
    print("add todo");
    String url = "${_mainUrl.mainUrl}/todos/add";
    try {
      Response data = await _dio.post(url,
          data:
              jsonEncode({'todo': todoDesc, 'completed': false, 'userId': id}));
      return Todos.fromJson(data.data);
    } on DioException catch (e) {
      print(e.response);
      throw NetworkException(e.message ?? "");
    } catch (e) {
      print(e);
      if (e is NetworkException) {
        throw NetworkException(e.message);
      } else {
        throw Exception();
      }
    }
  }
}
