import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsmanager/pages/settings.dart';
import 'package:subsmanager/pages/stream.dart';
import 'package:subsmanager/pages/subs.dart';
import 'globals.dart' as globals;
import 'models.dart' as models;

//Page Name

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => models.TabModel()),
      ],
      child: MaterialApp(
        title: globals.title,
        theme: ThemeData(
          primarySwatch: globals.customSwatch,
        ),
        home: const BasePage(title: globals.stream),
      ),
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
  final List<Widget> _pageLists = const [Stream(), Subs(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Consumer<models.TabModel>(
      builder: ((context, model, child) {
        return Scaffold(
          body: _pageLists[model.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.fork_right),
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
            currentIndex: model.currentIndex,
            selectedItemColor: globals.themeColor,
            onTap: model.onTapped,
          ),
        );
      }),
    );
  }
}
