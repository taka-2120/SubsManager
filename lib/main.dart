import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'globals.dart' as globals;
import 'notifier.dart';

final tabIndexProvider =
    StateNotifierProvider<TabIndex, int>((ref) => TabIndex(0));

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: globals.title,
      theme: ThemeData(
        primarySwatch: globals.customSwatch,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const BasePage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("ja", "JP"),
      ],
    );
  }
}

class BasePage extends ConsumerWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: tabIndex,
        children: globals.pageLists,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.fork_right),
          //   label: 'Stream',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: tabIndex,
        selectedItemColor: globals.themeColor,
        onTap: ref.read(tabIndexProvider.notifier).update,
      ),
    );
  }
}
