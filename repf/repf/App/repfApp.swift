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
    init() {
           FirebaseApp.configure()
       }
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
