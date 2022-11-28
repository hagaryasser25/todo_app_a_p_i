import 'package:flutter/widgets.dart';

import '../models/todo.dart';
import '../services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  final _service = TodoService();
  List<TodoModel> _todos = [];

  Future<void> addTodo(TodoModel body) async {
    final response = await _service.createTodo(body);
    notifyListeners();
  }

  Future<void> deleteTodoo(String id) async {
    final response = await _service.deleteTodo(id);
    notifyListeners();
  }

  

  getAllTodos() async {

    final response = await _service.getTodos();

    _todos = response;
    notifyListeners();
  }
  List<TodoModel> get memes => _todos;
}
