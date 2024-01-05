//
//  App288App.swift
//  App288
//
//  Created by IGOR on 15/12/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Apphud.start(apiKey: "app_GiVM9by5jCQajaYrNxnMru6ooXdLSX")
        
        OneSignal.initialize("7f30cc6a-a70c-42d8-ae3a-bec7720bc048", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("26fb8c1cac9588053dbe94d891baaa15")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func decodeBase64(_ base64String: String) -> String {
    
    guard let data = Data(base64Encoded: base64String) else { return base64String }
    
    guard let decodedResult = String(data: data, encoding: .utf8) else { return base64String }
    
    return decodedResult
}

@main
struct App288App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
