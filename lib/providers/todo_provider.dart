import 'package:flutter/material.dart';
import 'package:todo_test_api/models/todo_model.dart';
import 'package:todo_test_api/services/todo_service.dart';


class TodoProvider extends ChangeNotifier {
  List<Todo> todosList = [];

  final TodoService _todoService = TodoService();

  Future<void> todoList() async {
    todosList = await _todoService.getTodosListApi();
    notifyListeners();
  }

  Future<void> createNewNote(String todoName, bool? isComplete) async {
    await _todoService.createTodoApi(todoName, isComplete);
    await todoList();
  }

  Future<void> updateNote(String id, bool? isComplete) async {
    await _todoService.updateTodoApi(id, isComplete);
    await todoList();
  }
}
