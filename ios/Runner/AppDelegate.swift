import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let setNotifChannel = FlutterMethodChannel(name: "yu-takahashi.subsmanager/setNotif", binaryMessenger: controller.binaryMessenger)
    
        setNotifChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  private func setNotif(result: FlutterResult) {
    // SET ARGUMENT: TITLE, BODY, DAY
    let content = UNMutableNotificationContent()
    content.title = "The Billing Date Approaching"
    content.body = "Body"

    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current

    dateComponents.day = 15

    let trigger = UNCalendarNotificationTrigger(
      dateMatching: dateComponents, 
      repeats: true)
    
    let uuidString = UUID().uuidString
    let request = UNNotificationRequest(
      identifier: uuidString, 
      content: content, 
      trigger: trigger)

    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.add(request) { (error) in
      if error != nil {
          // Handle any errors.
      }
    }
  }
}
