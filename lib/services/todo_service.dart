import 'dart:convert';

import '../models/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  String baseUrl = 'https://api.nstack.in/v1/todos';
  Future<http.Response> createTodo(TodoModel data) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data.toJson()));

    if (response.statusCode == 201) {
      // return TodoModel.fromJson(jsonDecode(response.body));
      return response;
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future<List<TodoModel>> getTodos() async {
    Uri url = Uri.parse(baseUrl);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['items'];
      final todos = result.map(((e) => TodoModel.fromJson(e))).toList();
      return todos;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<http.Response> deleteTodo(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('$baseUrl/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}
}
