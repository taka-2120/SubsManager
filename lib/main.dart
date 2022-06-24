import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subsmanager/presentation/pages/auth/auth_outer.dart';
import 'package:subsmanager/presentation/pages/welcome/welcome_message.dart';
import 'package:subsmanager/use_case/app_info.dart';
import 'package:subsmanager/firebase_options.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/use_case/notifiers/periods.dart';
import 'package:subsmanager/presentation/widgets/default_appbar.dart';
import 'package:subsmanager/use_case/notifiers/tab_index.dart';
import 'package:subsmanager/presentation/pages/settings/settings.dart';
import 'package:subsmanager/presentation/pages/subs/subs.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/notifiers/user_data.dart';

const List<Widget> pageLists = [SubsMain(), Settings()];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo().getAppName(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (
          BuildContext context,
          AsyncSnapshot<SharedPreferences> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              backgroundColor: Theme.of(context).backgroundColor,
            );
          } else if (snapshot.data?.getBool("welcome") != null) {
            return const AuthOuter();
          } else {
            return const AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: WelcomeMessage(),
            );
          }
        },
      ),
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
    final readUserData = ref.read(userDataProvider.notifier);
    final theme = Theme.of(context);
    final l10n = L10n.of(context)!;
    const radius = Radius.circular(25);

    useEffect(
      () {
        final currentUser = FirebaseAuth.instance.currentUser!;
        readUserData.setData(currentUser.email!, currentUser.displayName);
        readPeriods.updateLocale(l10n);
        return;
      },
      [],
    );

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: const DefaultAppBar(),
      body: IndexedStack(
        index: tabIndex,
        children: pageLists,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.only(topLeft: radius, topRight: radius),
          boxShadow: [
            BoxShadow(
              color: theme.hoverColor,
              spreadRadius: 0,
              blurRadius: 15,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.only(topLeft: radius, topRight: radius),
          child: BottomNavigationBar(
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
        ),
      ),
    );
  }
}
