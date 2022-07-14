
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

  /// No description provided for @first_add.
  ///
  /// In en, this message translates to:
  /// **'Tap + button to add your subscriptions!'**
  String get first_add;

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

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

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

  /// No description provided for @intro_title.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get intro_title;

  /// No description provided for @intro_notif.
  ///
  /// In en, this message translates to:
  /// **'This app can notify you the billing date and prices. \nWe will send a notification 3 days before the billing date, but you can change this later in Settings tab. \nIn order to send notifications to you, please allow sending notification.'**
  String get intro_notif;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @userinfo.
  ///
  /// In en, this message translates to:
  /// **'User Info'**
  String get userinfo;

  /// No description provided for @notif.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notif;

  /// No description provided for @enable_notif.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
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

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get email;

  /// No description provided for @pass.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get pass;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @signout.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signout;

  /// No description provided for @update_username.
  ///
  /// In en, this message translates to:
  /// **'Update Username'**
  String get update_username;

  /// No description provided for @change_pass.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_pass;

  /// No description provided for @forget_pass.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forget_pass;

  /// No description provided for @reset_email_note.
  ///
  /// In en, this message translates to:
  /// **'The reset email will be sent to this address.'**
  String get reset_email_note;

  /// No description provided for @reset_email.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Email'**
  String get reset_email;

  /// No description provided for @send_feedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get send_feedback;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

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

  /// No description provided for @e_network.
  ///
  /// In en, this message translates to:
  /// **'Please check your Internet connection.'**
  String get e_network;

  /// No description provided for @e_login_empty.
  ///
  /// In en, this message translates to:
  /// **'Please make sure to fill Email address and password.'**
  String get e_login_empty;

  /// No description provided for @e_register_empty.
  ///
  /// In en, this message translates to:
  /// **'Please make sure to fill your username, email address, and password.'**
  String get e_register_empty;

  /// No description provided for @e_invaild_email.
  ///
  /// In en, this message translates to:
  /// **'E-mail format is incorecct.'**
  String get e_invaild_email;

  /// No description provided for @e_user_disabled.
  ///
  /// In en, this message translates to:
  /// **'This user is disabled.'**
  String get e_user_disabled;

  /// No description provided for @e_user_not_found.
  ///
  /// In en, this message translates to:
  /// **'This E-mail address is not registered.'**
  String get e_user_not_found;

  /// No description provided for @e_wrong_pass.
  ///
  /// In en, this message translates to:
  /// **'Password is incorrect. Please check it again.'**
  String get e_wrong_pass;

  /// No description provided for @e_unexpected.
  ///
  /// In en, this message translates to:
  /// **'Sorry, unknown error has occured. Please try again later.'**
  String get e_unexpected;

  /// No description provided for @e_email_already_in_use.
  ///
  /// In en, this message translates to:
  /// **'This Email address is already in use.'**
  String get e_email_already_in_use;

  /// No description provided for @e_all_disabled.
  ///
  /// In en, this message translates to:
  /// **'This Email address or password is currently disabled.'**
  String get e_all_disabled;

  /// No description provided for @e_weak_pass.
  ///
  /// In en, this message translates to:
  /// **'Your password is too weak. It should be 6 letters or more.'**
  String get e_weak_pass;

  /// No description provided for @e_username_empty.
  ///
  /// In en, this message translates to:
  /// **'Username cannot be empty.'**
  String get e_username_empty;

  /// No description provided for @e_no_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address.'**
  String get e_no_email;

  /// No description provided for @imp_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Important Cnofirmation'**
  String get imp_confirmation;

  /// No description provided for @conf_delete_account.
  ///
  /// In en, this message translates to:
  /// **'Do you sure want to delete your account?\nThis operation cannot be undone, and your data will be permanently deleted.'**
  String get conf_delete_account;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Cnofirmation'**
  String get confirmation;

  /// No description provided for @conf_logout.
  ///
  /// In en, this message translates to:
  /// **'Do you sure want to logout?'**
  String get conf_logout;

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

  /// No description provided for @d_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get d_save;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @agree_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'I agree to this Privacy Policy'**
  String get agree_privacy_policy;

  /// No description provided for @notif_perm.
  ///
  /// In en, this message translates to:
  /// **'Notifications Permission'**
  String get notif_perm;

  /// No description provided for @all_done.
  ///
  /// In en, this message translates to:
  /// **'All Done!'**
  String get all_done;

  /// No description provided for @done_msg.
  ///
  /// In en, this message translates to:
  /// **'Next, please login or register to our service!'**
  String get done_msg;

  /// No description provided for @lets_go.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Go!'**
  String get lets_go;

  /// No description provided for @welcome_msg.
  ///
  /// In en, this message translates to:
  /// **'Thank you for using SubsManager!\n\nLet\'s get startd to setup this app first, and register to our services!'**
  String get welcome_msg;

  /// No description provided for @join_us.
  ///
  /// In en, this message translates to:
  /// **'Join Us Now!'**
  String get join_us;
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
