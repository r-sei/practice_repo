import 'package:flutter_practice/services.dart/todo_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});