import 'package:flutter/material.dart';
import 'package:flutter_practice/components/todo_modal.dart';
import 'package:flutter_practice/model/model.dart';
import 'package:flutter_practice/provider/date_time_provider.dart';
import 'package:flutter_practice/provider/radio_provider.dart';
import 'package:flutter_practice/provider/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class DecisionButton extends ConsumerWidget {
  const DecisionButton({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(
                color: Colors.blue,
                width: 1,
              ),
            ),
            child: const Text(
              'cancel',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        ),
        const Gap(20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              final categoryLabel = ref.read(radioProvider).label;

              String category = '';
              switch (categoryLabel) {
                case 'LRN':
                  category = 'Learning';
                  break;
                case 'WRK':
                  category = 'Working';
                  break;
                case 'GEN':
                  category = 'General';
                  break;
              }

              ref.read(serviceProvider).addNewTask(TodoModel(
                    titleTask: titleController.text,
                    description: descriptionController.text,
                    category: category,
                    dateTask: ref.read(dateProvider),
                    timeTask: ref.read(timeProvider),
                    isDone: false,
                  ));

              //初期化
              titleController.clear();
              descriptionController.clear();
              ref.read(radioProvider.notifier).update((_) => TodoType.learn);
              ref.read(timeProvider.notifier).update((_) => 'hh : mm');
              ref.read(dateProvider.notifier).update((_) => 'yyyy/mm/dd');
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(
                color: Colors.blue,
                width: 1,
              ),
            ),
            child: const Text(
              'create',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
