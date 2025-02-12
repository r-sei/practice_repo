import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_practice/model/model.dart';
import 'package:flutter_practice/services.dart/todo_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});

//なにこれ
final fetchStreamProvider = StreamProvider<List<TodoModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('todoApp')
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => TodoModel.fromSnapshot(snapshot))
          .toList());

  yield* getData;
});
