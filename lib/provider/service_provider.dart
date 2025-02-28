import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_practice/model/model.dart';
import 'package:flutter_practice/provider/sort_provider.dart';
import 'package:flutter_practice/services.dart/todo_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});

final fetchStreamProvider = StreamProvider<List<TodoModel>>((ref) async* {
  final sortType = ref.watch(sortTypeProvider);
  final isAscending = ref.watch(isAscendingProvider);

  Query query = FirebaseFirestore.instance.collection('todoApp');

  switch (sortType) {
    case SortType.title:
      query = query.orderBy('titleTask', descending: !isAscending);
      break;
    case SortType.date:
      query = query.orderBy('dateTask', descending: !isAscending);
      break;
    case SortType.category:
      query = query.orderBy('category', descending: !isAscending);
      break;
  }

  final getData = query.snapshots().map(
        (event) => event.docs
            .map((snapshot) => TodoModel.fromSnapshot(
                snapshot as DocumentSnapshot<Map<String, dynamic>>))
            .toList(),
      );

  yield* getData;
});
