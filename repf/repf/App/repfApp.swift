//
//  repfApp.swift
//  repf
//
//  Created by oobin on 9/14/24.
//

import SwiftUI
import Firebase

@main
struct repfApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        print(" SwiftUI App 초기화")
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
                .customFont("Pretendard")
        }
    }
}

