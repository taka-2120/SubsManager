import 'package:flutter/material.dart';
import 'package:subsmanager/pages/settings.dart';
import 'package:subsmanager/pages/stream.dart';
import 'package:subsmanager/pages/subs.dart';
import 'globals.dart' as globals;

//Page Name

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: globals.title,
      theme: ThemeData(
        primarySwatch: globals.customSwatch,
      ),
      home: const BasePage(title: globals.stream),
    );
  }
}

class BasePage extends StatefulWidget {
  const BasePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  static List<Widget> pageLists = const [Stream(), Subs(), Settings()];

  //W
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageLists[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fork),
            label: 'Stream',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: globals.themeColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
