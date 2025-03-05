import 'package:flutter/material.dart';
import 'package:flutter_practice/provider/sort_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortButton extends ConsumerWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAscending = ref.watch(isAscendingProvider);
    final sortType = ref.watch(sortTypeProvider); //いつ使おう

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //昇順・降順選択
        IconButton(
            onPressed: () {
              ref.read(isAscendingProvider.notifier).state = !isAscending;
            },
            icon:
                Icon(isAscending ? Icons.arrow_upward : Icons.arrow_downward)),

        //ソートの種類選択
        PopupMenuButton<SortType>(
          tooltip: 'sort',
          icon: const Icon(Icons.sort),
          onSelected: (SortType selectedType) {
            ref.read(sortTypeProvider.notifier).update((_) => selectedType);
            //デフォルトの昇順にリセット
            ref.read(isAscendingProvider.notifier).update((_) => true);
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
                value: SortType.title, child: Text("Task Title")),
            const PopupMenuItem(value: SortType.date, child: Text("Task Date")),
            const PopupMenuItem(
                value: SortType.category, child: Text("Task Type")),
            const PopupMenuItem(
                value: SortType.done, child: Text("Done")),
          ],
        ),
      ],
    );
  }
}
