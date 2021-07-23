//
//  Chat.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/22.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth

struct Chat: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var firebaseAuth = Auth.auth()
    @State var userName:String = ""
    
    init() {
        _userName = State(initialValue: firebaseAuth.currentUser?.displayName ?? "nil")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Chat Page")
            }
            .navigationBarTitle("Chat", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action : logout)  {
                        Text("Log out")
                })
        }
    }
    
    func logout() {
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        self.mode.wrappedValue.dismiss()
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
