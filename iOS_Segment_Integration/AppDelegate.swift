//
//  AppDelegate.swift
//  iOS_Segment_Integration
//
//  Created by Karthik Iyer on 18/01/23.
//

import UIKit
//import CleverTapSDK
import Segment_CleverTap
import Segment
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Analytics.debug(true)
//        CleverTap.setDebugLevel(CleverTapLogLevel.debug.rawValue+1)
        
        let config = AnalyticsConfiguration(writeKey: "Yhppg7GRbCW2jQ27Pu4EzvIxDTMqH2J0")
        config.use(SEGCleverTapIntegrationFactory())
        config.trackApplicationLifecycleEvents
        Analytics.setup(with: config)

        let traits: [String: Any] = [
//            "email": "segmentios1@clevertap.com",
//            "name": "Segment iOS 1",
//            "phone" : "0234567891",
            "Language": "iOS-English"
        ]

        Analytics.shared().identify("", traits: traits)
//        Analytics.shared().track("segmentios1", properties: ["eventProperty":"eventPropertyValue"])
        
        // push notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) {
            (granted, error) in
            if (granted) {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        
        return true
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

