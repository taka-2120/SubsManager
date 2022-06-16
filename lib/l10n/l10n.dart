
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

/// Callers can lookup localized strings with an instance of L10n returned
/// by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @subscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get subscriptions;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notif.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notif;

  /// No description provided for @enable_notif.
  ///
  /// In en, this message translates to:
  /// **'Enable Notification'**
  String get enable_notif;

  /// No description provided for @credits.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get credits;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete_sub.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete_sub;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @e_fill.
  ///
  /// In en, this message translates to:
  /// **'Please fill name, fee, and billing period correctly.'**
  String get e_fill;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @annually.
  ///
  /// In en, this message translates to:
  /// **'Annually'**
  String get annually;

  /// No description provided for @monthly_total.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly_total;

  /// No description provided for @annually_total.
  ///
  /// In en, this message translates to:
  /// **'Annually'**
  String get annually_total;

  /// No description provided for @semi_annually.
  ///
  /// In en, this message translates to:
  /// **'Semi-Annually'**
  String get semi_annually;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @fee.
  ///
  /// In en, this message translates to:
  /// **'Fee'**
  String get fee;

  /// No description provided for @url.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get url;

  /// No description provided for @next_billing_date.
  ///
  /// In en, this message translates to:
  /// **'Next Billing Date'**
  String get next_billing_date;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @billing_period.
  ///
  /// In en, this message translates to:
  /// **'Billing Period'**
  String get billing_period;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @d_ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get d_ok;

  /// No description provided for @d_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get d_continue;

  /// No description provided for @d_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get d_cancel;

  /// No description provided for @the_day.
  ///
  /// In en, this message translates to:
  /// **'On The Day'**
  String get the_day;

  /// No description provided for @one_day.
  ///
  /// In en, this message translates to:
  /// **'1 Day Before'**
  String get one_day;

  /// No description provided for @two_days.
  ///
  /// In en, this message translates to:
  /// **'2 Days Before'**
  String get two_days;

  /// No description provided for @three_days.
  ///
  /// In en, this message translates to:
  /// **'3 Days Before'**
  String get three_days;

  /// No description provided for @four_days.
  ///
  /// In en, this message translates to:
  /// **'4 Days Before'**
  String get four_days;

  /// No description provided for @five_days.
  ///
  /// In en, this message translates to:
  /// **'5 Days Before'**
  String get five_days;

  /// No description provided for @six_days.
  ///
  /// In en, this message translates to:
  /// **'6 Days Before'**
  String get six_days;

  /// No description provided for @one_week.
  ///
  /// In en, this message translates to:
  /// **'1 Week Before'**
  String get one_week;

  /// No description provided for @two_weeks.
  ///
  /// In en, this message translates to:
  /// **'2 Weeks Before'**
  String get two_weeks;

  /// No description provided for @three_weeks.
  ///
  /// In en, this message translates to:
  /// **'3 Weeks Before'**
  String get three_weeks;

  /// No description provided for @alph_acc.
  ///
  /// In en, this message translates to:
  /// **'A to Z'**
  String get alph_acc;

  /// No description provided for @alph_dec.
  ///
  /// In en, this message translates to:
  /// **'Z to A'**
  String get alph_dec;

  /// No description provided for @date_acc.
  ///
  /// In en, this message translates to:
  /// **'Earier to Later'**
  String get date_acc;

  /// No description provided for @date_dec.
  ///
  /// In en, this message translates to:
  /// **'Later to Earier'**
  String get date_dec;

  /// No description provided for @price_acc.
  ///
  /// In en, this message translates to:
  /// **'High to Low'**
  String get price_acc;

  /// No description provided for @price_dec.
  ///
  /// In en, this message translates to:
  /// **'Low to High'**
  String get price_dec;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'ja': return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}