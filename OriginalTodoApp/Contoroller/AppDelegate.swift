//
//  AppDelegate.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var notificationGranted = true

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        if #available(iOS 10.0, *) {
                  // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
                  
                  let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                  UNUserNotificationCenter.current().requestAuthorization(
                      options: authOptions,
                      completionHandler: {_, _ in })
              } else {
                  let settings: UIUserNotificationSettings =
                      UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                  application.registerUserNotificationSettings(settings)
              }
              
              application.registerForRemoteNotifications()

              UNUserNotificationCenter.current().requestAuthorization(
                  options: [.alert,.sound])
              {
                  (granted, error) in
                  self.notificationGranted = granted
                  if let error = error {
                      print("granted, but Error in notification permission:\(error.localizedDescription)")
                  }}

       
        
        let storyboard:UIStoryboard = self.grabStoryboard()
                               
                        if let window = window{
                                  window.rootViewController = storyboard.instantiateInitialViewController() as UIViewController?
                               }
                          self.window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // Print message ID.
        if let messageID = userInfo["gcm.message_id"] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Print message ID.
        if let messageID = userInfo["gcm.message_id"] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    
    func grabStoryboard() -> UIStoryboard{
            
            var storyboard = UIStoryboard()
            let height = UIScreen.main.bounds.size.height
            if height == 667 {
                storyboard = UIStoryboard(name: "Main", bundle: nil)
                //iPhone8
            }else if height == 736 {
                storyboard = UIStoryboard(name: "iPhone8plus", bundle: nil)
                //iPhone8Plus
            }else if height == 812{
                storyboard = UIStoryboard(name: "iPhoneXS", bundle: nil)
            
            }else if height == 1112{

                storyboard = UIStoryboard(name: "iPad", bundle: nil)
            }else{

                switch UIDevice.current.model {
                case "iPnone" :
                storyboard = UIStoryboard(name: "se", bundle: nil)
                    break
                case "iPad" :
                storyboard = UIStoryboard(name: "iPad", bundle: nil)
                print("iPad")
                    break
                default:
                    break
                }
            }
            return storyboard
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        if let messageID = userInfo["gcm.message_id"] {
            print("Message ID: \(messageID)")
        }
        
        print(userInfo)
        
        completionHandler([])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if let messageID = userInfo["gcm.message_id"] {
            print("Message ID: \(messageID)")
        }
        
        print(userInfo)
        
        completionHandler()
    }
}


