import 'package:flutter_practice/components/todo_modal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final radioProvider = StateProvider((ref) {
  return TodoType.learn;
});
