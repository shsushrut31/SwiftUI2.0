//
//  SwiftUI_IOS14_UpdateApp.swift
//  SwiftUI_IOS14_Update
//
//  Created by Sushrut Shastri on 2020-07-03.
//

import SwiftUI

@main
struct SwiftUI_IOS14_UpdateApp: App {
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
