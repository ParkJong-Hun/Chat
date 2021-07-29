//
//  Chat.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/22.
//
import SwiftUI
import FirebaseAuth
//MARK:채팅 페이지
struct Chat: View {
    //현재 모드(Navigation Stack 이용하기 위함)
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    //로그인 객체
    @State var firebaseAuth = Auth.auth()
    //유저 이름
    @State var userName:String = ""
    let messageData = MessageData()
    init() {
        _userName = State(initialValue: firebaseAuth.currentUser?.displayName ?? "nil")
    }
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Message(messageData: messageData)
                }
                .navigationBarTitle("Chat", displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action : logout)  {
                            Text("Log out")
                    })
                .listStyle(PlainListStyle())
                Input()
            }
        }
    }
    //로그아웃 버튼 클릭 시
    func logout() {
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        self.mode.wrappedValue.dismiss()
    }
}
