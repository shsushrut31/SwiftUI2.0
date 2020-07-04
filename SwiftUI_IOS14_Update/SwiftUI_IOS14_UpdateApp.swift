//
//  SwiftUI_IOS14_UpdateApp.swift
//  SwiftUI_IOS14_Update
//
//  Created by Sushrut Shastri on 2020-07-03.
//

import SwiftUI

@main
struct SwiftUI_IOS14_UpdateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                TextEditor_Demo()
                Grid_Demo()
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}
///Add Appdelegate in case we need to handle things like Push Notifications
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Finished Launching")
        return true
    }
}
