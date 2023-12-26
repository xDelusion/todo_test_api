import 'package:dio/dio.dart';
import 'package:todo_test_api/models/todo_model.dart';

class TodoService {
  final String serverUrl = "https://calm-plum-jaguar-tutu.cyclic.app/todos";
  final Dio _dio = Dio();

  Future<List<Todo>> getTodoList() async {
    try {
      final response = await _dio.get(serverUrl);
      TodoModel todoModel = TodoModel.fromJson(response.data);
      return todoModel.data;
    } catch (e) {
      throw e.toString();
    }
  }

  createTodo(String title, bool? value) async {
    try {
      final response = await _dio.post(serverUrl, data: {
        "todoName": title,
        "isComplete": value,
      });
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  updateTodo(String id, bool? value) async {
    try {
      final response =
          await _dio.put("$serverUrl/$id", data: {"isComplete": value});
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
