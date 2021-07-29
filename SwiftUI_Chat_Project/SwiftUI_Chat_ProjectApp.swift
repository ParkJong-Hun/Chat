//
//  SwiftUI_Chat_ProjectApp.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/21.
//
import SwiftUI
import Firebase
//MARK: App단 (기본 환경설정)
@main
struct SwiftUI_Chat_ProjectApp: App {
    init() {
        //FirebaseApp 사용
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
