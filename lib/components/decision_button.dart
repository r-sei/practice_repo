import 'package:flutter/material.dart';
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
            onPressed: () {},
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
              final getRadioValue = ref.read(radioProvider);
              String category = '';

              switch (getRadioValue) {
                case 1:
                  category = 'Learning';
                case 2:
                  category = 'Working';
                case 3:
                  category = 'General';
                  break;
              }

              ref.read(serviceProvider).addNewTask(TodoModel(
                  titleTask: titleController.text,
                  description: descriptionController.text,
                  category: category,
                  dateTask: ref.read(dateProvider),
                  timeTask: ref.read(timeProvider)));

              print(
                  'Title: ${titleController.text}, Description: ${descriptionController.text},' /*Category: ${selectedType.label}, Date: $dateTask, Time: $timeTask'*/);
              print('Data is saving');
              print(
                  '${titleController.text}   ${titleController.text}     $category     ${ref.read(dateProvider)}      ${ref.read(timeProvider)}');
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
