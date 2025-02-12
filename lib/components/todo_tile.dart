import 'package:flutter/material.dart';
import 'package:flutter_practice/provider/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(
        //なにこれ
        data: (todoData) => Container(
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
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  todoData[getIndex].titleTask,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  todoData[getIndex].description,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            // const Expanded(child: Spacer()),
                            Checkbox(
                                value: todoData[getIndex].isDone,
                                shape: const CircleBorder(),
                                onChanged: (value) => print(value)),
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
                              todoData[getIndex].timeTask,
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
            ),
        error: (error, stackTrace) => Center(
              child: Text(stackTrace.toString()),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
