import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

enum RadioValue { LRN, WRK, GEN }

RadioValue? selectedValue;
DateTime? selectedDate;
TimeOfDay? selectedTime = TimeOfDay.now();

class TodoModal extends StatefulWidget {
  @override
  State<TodoModal> createState() => TodoModalState();
}

class TodoModalState extends State<TodoModal> {
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
            const Gap(5),
            TextField(
              decoration: InputDecoration(
                  hintText: ' Add Task Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  fillColor: const Color.fromARGB(
                      100, 190, 190, 190), //colors.grey.shade200とかどう使うん
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20), //角丸と枠なしの両立方法がわからん
                  ),
                  prefixIcon: const Icon(Icons.calendar_month)),
            ),
            const Gap(5),
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
                fillColor: Color.fromARGB(
                    100, 190, 190, 190), //colors.grey.shade200とかどう使うん
                filled: true,
                border: InputBorder.none,
              ),
            ),
            const Gap(5),
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
                  Row(
                    children: [
                      Radio(
                          value: RadioValue.LRN,
                          groupValue: selectedValue,
                          onChanged: (RadioValue? val) {
                            setState(() {
                              selectedValue = val;
                            });
                          },
                          fillColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.disabled)) {
                              return const Color.fromARGB(255, 65, 215, 23);
                            }
                            return const Color.fromARGB(255, 65, 215, 23);
                          })),
                      const Text("LRN",
                          style: TextStyle(
                            color: Color.fromARGB(255, 65, 215, 23),
                            fontSize: 12.0,
                          )),
                      const Gap(50),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: RadioValue.WRK,
                          groupValue: selectedValue,
                          onChanged: (RadioValue? val) {
                            setState(() {
                              selectedValue = val;
                            });
                          },
                          fillColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.disabled)) {
                              return const Color.fromARGB(255, 23, 161, 215);
                            }
                            return const Color.fromARGB(255, 23, 161, 215);
                          })),
                      const Text("WRK",
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 161, 215),
                            fontSize: 12.0,
                          )),
                      const Gap(50),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: RadioValue.GEN,
                          groupValue: selectedValue,
                          onChanged: (RadioValue? val) {
                            setState(() {
                              selectedValue = val;
                            });
                          },
                          fillColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.disabled)) {
                              return const Color.fromARGB(255, 255, 179, 0);
                            }
                            return const Color.fromARGB(255, 255, 179, 0);
                          })),
                      const Text("GEN",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 179, 0),
                            fontSize: 12.0,
                          )),
                      const Gap(50),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: const Text(
                      'Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  //ここからdate入力フォーム
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    color: const Color.fromARGB(100, 190, 190, 190),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              // print("start");
                              final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030));
                              // print("finished: $date");
                              if (date != null) {
                                setState(() {
                                  selectedDate = date;
                                });
                              }
                            },
                            icon: const Icon(Icons.calendar_month)),
                        Text(selectedDate != null
                            ? "${selectedDate?.year}/${selectedDate?.month}/${selectedDate?.day}"
                            : "yyyy/mm/dd"),
                      ],
                    ),
                  ),
                ]),
                //ここまでDate入力フォーム
                Gap(MediaQuery.of(context).size.width / 12),
                //ここからTime入力フォーム
                Column(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: const Text(
                      'Time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    color: const Color.fromARGB(100, 190, 190, 190),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              // print("start");
                              final timeData = await showTimePicker(
                                  initialEntryMode: TimePickerEntryMode.dial,
                                  context: context,
                                  initialTime: selectedTime != null
                                      ? selectedTime!
                                      : TimeOfDay.now());
                              // print("finished: $date");
                              if (timeData != null) {
                                setState(() {
                                  selectedTime = timeData;
                                });
                              }
                            },
                            icon: const Icon(Icons.access_time)),
                        Text(selectedTime != null
                            ? "${selectedTime?.hour}:${selectedTime?.minute}"
                            : "hh:mm"),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
