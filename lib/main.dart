import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello I'm",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                )),
            Text("Mohamed Ali",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                )),
          ],
        ),
        // const Text("Hello I'm"),
        leading: const _ProfileIcon(),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.calendar_month)),
          IconButton(onPressed: null, icon: Icon(Icons.notifications_none))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today's Task",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    _GetWeekday(),
                  ],
                ),
                Expanded(
                  child: Container(), // spacerでもいい
                ),
                ElevatedButton(
                    onPressed: () => showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return _ModalWindow();
                        }),
                    child: const Text('+ New Task')),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon();

  @override
  Widget build(BuildContext context) {
    return const IconButton(
      onPressed: null,
      icon: CircleAvatar(
        backgroundColor: Color.fromRGBO(247, 236, 21, 1),
        foregroundImage: AssetImage('assets/profile.png'),
        radius: 30.0,
      ),
    );
  }
}

class _GetWeekday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_US');
    DateTime now = DateTime.now();
    String week = DateFormat('EEEE', 'en_US').format(now);
    String month = DateFormat('MMMM', 'en_US').format(now);

    return Text(
      '$week, ${now.day} $month,',
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }
}

enum RadioValue { LRN, WRK, GEN }

RadioValue? selectedValue;

class _ModalWindow extends StatefulWidget {
  @override
  State<_ModalWindow> createState() => _ModalWindowState();
}

class _ModalWindowState extends State<_ModalWindow> {
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: __getCalendarPageState(),
                          icon: Icon(Icons.calendar_month)),
                          Text("yyyy/mm/ddをiconから取得予定")
                    ],
                  ),
                ]),
                //ここにも上と同じcolumnをコピーして、時間選択
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _getCalendar extends StatefulWidget {
  const _getCalendar({super.key});

  @override
  State<_getCalendar> createState() => __getCalendarPageState();
}

class __getCalendarPageState extends State<_getCalendar> {
  // カレンダーが表示される日付
  DateTime _focusedDay = DateTime.now();
  // カレンダー上でマークが表示される日付
  DateTime _currentDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          currentDay: _currentDay, // マークが表示される日付
          onDaySelected: ((selectedDay, focusedDay) {
            setState(() {
              _currentDay = selectedDay; // タップした際にマーク位置を更新
              _focusedDay = selectedDay; // タップした際にカレンダーの表示位置を更新
            });
          }),
        ),
      ),
    );
  }
}
