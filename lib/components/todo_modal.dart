import 'package:flutter/material.dart';
import 'package:flutter_practice/components/date_form.dart';
import 'package:flutter_practice/components/decision_button.dart';
import 'package:flutter_practice/components/radio_button.dart';
import 'package:flutter_practice/components/time_form.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

enum TodoType {
  learn('LRN', Color.fromARGB(255, 65, 215, 23)),
  work('WRK', Color.fromARGB(255, 23, 161, 215)),
  general('GEN', Color.fromARGB(255, 255, 179, 0));

  const TodoType(this.label, this.color);

  final String label;
  final Color color;
}

class TodoModal extends StatefulWidget {
  @override
  State<TodoModal> createState() => TodoModalState();
}

class TodoModalState extends State<TodoModal> {
  TodoType? selectedType;
  @override
  Widget build(BuildContext context) {
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
            TextField(
              decoration: InputDecoration(
                  hintText: ' Add Task Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  fillColor: const Color.fromARGB(100, 190, 190,
                      190), //colors.grey.shade200とかどう使うん(const外せば解決)
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20), //角丸と枠なしの両立方法がわからん
                  ),
                  prefixIcon: const Icon(Icons.calendar_month)),
            ),
            const Gap(20),
            const Text(
              'Description',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: ' Add Description',
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color.fromARGB(100, 190, 190, 190),
                filled: true,
                border: InputBorder.none,
              ),
            ),
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
                              setState(() {
                                selectedType = value;
                              });
                            })),
                    // Text('繰り返し表示'),
                  }
                ],
              ),
            ),
            const Gap(20),
            const Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: DateForm()),
                //ここまでDate入力フォーム
                Gap(20),
                //ここからTime入力フォーム
                Expanded(child: TimeForm()),
              ],
            ),
            const Gap(20),
            const DecisionButton(),
          ],
        ),
      ),
    );
  }
}
