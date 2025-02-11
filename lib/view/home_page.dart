import 'package:flutter/material.dart';
import 'package:flutter_practice/components/get_weekday.dart';
import 'package:flutter_practice/components/profile_icon.dart';
import 'package:flutter_practice/components/todo_modal.dart';
import 'package:flutter_practice/components/todo_tile.dart';
import 'package:gap/gap.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todos = {0, 1, 2, 4};
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
                  fontSize: 16.0,
                )),
          ],
        ),
        // const Text("Hello I'm"),
        leading: const ProfileIcon(),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.calendar_month)),
          IconButton(onPressed: null, icon: Icon(Icons.notifications_none))
        ],
      ),
      body: ListView(padding: const EdgeInsets.all(20.0), children: [
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
                GetWeekday(),
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
                      return const TodoModal();
                    }),
                child: const Text('+ New Task')),
          ],
        ),
        const Gap(30),
        for (final todo in todos) ...[
          const TodoTile(),
          const Gap(20),
        ]
      ]),
    );
  }
}
