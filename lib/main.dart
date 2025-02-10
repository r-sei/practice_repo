import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/components/todo_modal.dart';
import 'package:flutter_practice/components/todo_tile.dart';
import 'package:flutter_practice/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:gap/gap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
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

bool isChecked = false;

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
        leading: const _ProfileIcon(),
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
                      return TodoModal();
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
