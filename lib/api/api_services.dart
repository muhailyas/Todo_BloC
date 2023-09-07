import 'dart:convert';
import 'dart:developer';
import '../model/todo_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices._();
  static final ApiServices instance = ApiServices._();

  factory ApiServices() => instance;

  static const String endPoint =
      "https://api.nstack.in/v1/todos?page=1&limit=10";

  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(
      Uri.parse(endPoint),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> items = responseData['items'];
      return items.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch todos');
    }
  }

  Future<void> createTodo(Todo todo) async {
    final response = await http.post(
      Uri.parse(endPoint),
      body: jsonEncode({
        'title': todo.title,
        'description': todo.description,
        'is_completed': todo.isCompleted,
      }),
    );

    if (response.statusCode == 201) {
      log("todo Created");
    } else {
      log('Failed to create todo ${response.statusCode}');
    }
  }
}
