import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/components/todo_modal.dart';
import 'package:flutter_practice/model/model.dart';
import 'package:flutter_practice/provider/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCategory = todo.category;
    Color categoryColor = Colors.white;

    switch (getCategory) {
      case 'Learning':
        categoryColor = TodoType.learn.color;
        break;
      case 'Working':
        categoryColor = TodoType.work.color;
        break;
      case 'General':
        categoryColor = TodoType.general.color;
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            decoration: BoxDecoration(
              color: categoryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => ref
                                .read(serviceProvider)
                                .deleteTask(todo.docID),
                            icon: const Icon(CupertinoIcons.delete)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              todo.titleTask,
                              maxLines: 1,
                              style: TextStyle(
                                decoration: todo.isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              todo.description,
                              maxLines: 1,
                              style: TextStyle(
                                decoration: todo.isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // const Expanded(child: Spacer()),
                    Checkbox(
                        value: todo.isDone,
                        shape: const CircleBorder(),
                        onChanged: (value) => ref
                            .read(serviceProvider)
                            .updateTask(todo.docID, value)),
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Today",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const Gap(16),
                    Text(
                      todo.timeTask,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
