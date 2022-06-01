import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/notifiers/periods.dart';

import 'presentation/hooks/pages.dart';
import 'presentation/notifiers/tab_index.dart';
import 'theme.dart';

//Sort                      1
//Notification              2
//Tap Animation             3
//Favicon                   4

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const BasePage(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
    );
  }
}

class BasePage extends HookConsumerWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);
    final readTabIndex = ref.read(tabIndexProvider.notifier);
    final readPeriods = ref.read(periodsProvider.notifier);
    final theme = Theme.of(context);
    final l10n = L10n.of(context)!;

    useEffect(
      () {
        readPeriods.updateLocale(l10n);
        return;
      },
      [],
    );

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: IndexedStack(
        index: tabIndex,
        children: pageLists,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_balance_wallet),
            label: l10n.subscriptions,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: l10n.settings,
          ),
        ],
        currentIndex: tabIndex,
        selectedItemColor: primaryColor,
        onTap: readTabIndex.update,
      ),
    );
  }
}
