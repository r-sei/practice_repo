import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
        leading: _ProfileIcon(),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.calendar_month)),
          IconButton(
              onPressed: null, icon: const Icon(Icons.notifications_none))
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _ProfileIcon() {
    return IconButton(
      onPressed: null,
      icon: CircleAvatar(
        backgroundColor: const Color.fromRGBO(247, 236, 21, 1),
        child: Image.asset('assets/profile.png'),
        radius: 30.0,
      ),
    );
  }
}
