import 'package:dio/dio.dart';
import 'package:todo_test_api/models/todo_model.dart';
import 'package:todo_test_api/services/client.dart';

class TodoService {
  Future<List<Todo>> getTodosListApi() async {
    try {
      final responseValue = await ApiClient.get("/todos");
      if (responseValue.statusCode == 200) {
        final TodoModel todoModel = TodoModel.fromJson(responseValue.data);
        return todoModel.data;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }

  createTodoApi(String todoName, bool? isComplete) async {
    try {
      final Response response = await ApiClient.post(
        "/todos",
        data: {
          "todoName": todoName,
          "isComplete": isComplete,
        },
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  updateTodoApi(String id, bool? isComplete) async {
    try {
      final response = await ApiClient.put(
        "todos/$id",
        data: {
          "isComplete": isComplete,
        },
      );

      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
