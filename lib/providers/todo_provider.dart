import 'package:flutter/material.dart';
import 'package:todo_test_api/models/todo_model.dart';
import 'package:todo_test_api/services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todosList = [];
  final _todoService = TodoService();

  Future<void> getTodos() async {
    todosList = await _todoService.getTodoList();
    notifyListeners();
  }

  updateTodo(String id, bool? value) async {
    await _todoService.updateTodo(id, value);
    await getTodos();
  }

  createNewNote(String title, bool? isComplete) async {
    await _todoService.createTodo(title, isComplete);
    await getTodos();
  }
}
