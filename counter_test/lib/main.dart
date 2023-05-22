import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Counter {
  int value;

  Counter(this.value);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App Enhanced',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Welcome To My Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Counter> _counters = [];
  int _currentIndex = 0;

  void _createCounter() {
    setState(() {
      _counters.add(Counter(0));
    });
  }

  void _switchCounter(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      if (_counters.isNotEmpty) {
        _counters[_currentIndex].value++;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Counter incremented to ${_counters[_currentIndex].value}'),
          ),
        );
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counters.isNotEmpty) {
        _counters[_currentIndex].value--;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Counter decremented to ${_counters[_currentIndex].value}'),
            ),
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _counters.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _switchCounter(index),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: ListTile(
                        title: Text('Counter ${index + 1}'),
                        tileColor: _currentIndex == index ? Colors.teal : Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
      Divider(),
            Center(
              child: _counters.isNotEmpty
                  ? Text('Counter: ${_counters[_currentIndex].value}', style: TextStyle(fontSize: 24))
                  : Text('No counters available', style: TextStyle(fontSize: 24)),
            ),
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Tooltip(
            message: 'Increment',
            child: ElevatedButton(
              onPressed: _decrementCounter,
              child: const Icon(Icons.remove),
            ),
          ),
          FloatingActionButton.extended(onPressed: (){
            setState(() {
              if (_counters.isNotEmpty) {
                _counters[_currentIndex].value=0;
              }
            });
          },
            label: Text('Reset'), icon: Icon(Icons.refresh),
          ),
          Tooltip(
            message: 'Increment',
            child: ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ),
           FloatingActionButton.extended(
            onPressed: _createCounter,
            label: Text('Create'),
            icon: Icon(Icons.add),
          ),
          ],
        ),
            SizedBox(height: 100),
      ],
      ),
    ),
    );
  }
}
