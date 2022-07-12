import 'package:feedback/feedback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subsmanager/presentation/pages/auth/auth_outer.dart';
import 'package:subsmanager/presentation/pages/welcome/welcome_message.dart';
import 'package:subsmanager/firebase_options.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/default_appbar_widget.dart';
import 'package:subsmanager/presentation/pages/settings/settings.dart';
import 'package:subsmanager/presentation/pages/subs/subs.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/notifiers/versions_notifier.dart';
import 'package:subsmanager/use_case/user_data/notifier/user_data.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

const List<Widget> pageLists = [SubsMain(), Settings()];

void main() async {
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    'resource://drawable/res_app_icon',
    [
      NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white)
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
          channelGroupkey: 'basic_channel_group',
          channelGroupName: 'Basic group')
    ],
    debug: true,
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SubsManager",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      home: BetterFeedback(
        localizationsDelegates: L10n.localizationsDelegates,
        child: FutureBuilder<SharedPreferences>(
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
      ),
    );
  }
}

class BasePage extends HookConsumerWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = useState(0);
    final readUserData = ref.read(userDataProvider.notifier);
    final theme = Theme.of(context);
    final l10n = L10n.of(context)!;
    const radius = Radius.circular(25);
    final versionNotifier = ref.read(versionNotifierProvider.notifier);

    useEffect(
      () {
        final currentUser = FirebaseAuth.instance.currentUser!;
        readUserData.setData(
            currentUser.email!, currentUser.displayName ?? "Not Set");

        PackageInfo.fromPlatform().then((value) {
          versionNotifier.update(value.version);
        });
        return;
      },
      [],
    );

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: const DefaultAppBar(),
      body: IndexedStack(
        index: tabIndex.value,
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
            currentIndex: tabIndex.value,
            selectedItemColor: primaryColor,
            onTap: (val) {
              tabIndex.value = val;
            },
          ),
        ),
      ),
    );
  }
}
