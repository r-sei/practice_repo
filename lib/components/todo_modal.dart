import 'package:flutter/material.dart';
import 'package:flutter_practice/components/date_form.dart';
import 'package:flutter_practice/components/decision_button.dart';
import 'package:flutter_practice/components/radio_button.dart';
import 'package:flutter_practice/components/textfield_widget.dart';
import 'package:flutter_practice/components/time_form.dart';
import 'package:flutter_practice/provider/radio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

enum TodoType {
  learn('LRN', Color.fromARGB(255, 65, 215, 23)),
  work('WRK', Color.fromARGB(255, 23, 161, 215)),
  general('GEN', Color.fromARGB(255, 255, 179, 0));

  const TodoType(this.label, this.color);

  final String label;
  final Color color;
}

class TodoModal extends ConsumerWidget {
  const TodoModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final selectedType = ref.watch(radioProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text(
                'New Task Todo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(
              thickness: 1.2,
            ),
            const Text(
              'Title Task',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const Gap(8),
            TextfieldWidget(
                hintText: 'Add Task Name',
                maxLine: 1,
                txtController: titleController),
            const Gap(20),
            const Text(
              'Description',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            TextfieldWidget(
                hintText: 'Add Description',
                maxLine: 5,
                txtController: descriptionController),
            const Gap(20),
            const Text(
              'Category',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Container(
              color: const Color.fromARGB(156, 230, 230, 230),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (final type in TodoType.values) ...{
                    Expanded(
                        child: RadioButton(
                            todoType: type,
                            selectedType: selectedType,
                            onChanged: (value) {
                              if (value != null) {
                                ref
                                    .read(radioProvider.notifier)
                                    .update((_) => value);
                              }
                            })),
                  }
                ],
              ),
            ),
            const Gap(20),
            const Row(
              children: [
                Expanded(child: DateForm()),
                Gap(20),
                Expanded(child: TimeForm()),
              ],
            ),
            const Gap(20),
            DecisionButton(
                titleController: titleController,
                descriptionController: descriptionController),
          ],
        ),
      ),
    );
  }
}
