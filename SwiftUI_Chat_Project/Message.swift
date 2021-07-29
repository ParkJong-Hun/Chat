//
//  Message.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct Message: View {
    @ObservedObject var messageData:MessageData
    @State var isMine:Bool = false
    @State var lastId = 0
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    if messageData.texts.count != 0 {
                        ForEach(0..<messageData.texts.count, id: \.self) { index in
                            if(messageData.uids[index] == Auth.auth().currentUser?.uid) {
                                MyMessage(userName: messageData.userNames[index], text: messageData.texts[index], date: messageData.dates[index]).onAppear{
                                    if(index == messageData.texts.count - 1) {
                                        self.isMine = true
                                    }
                                }.id(lastId)
                            } else {
                                TheyMessage(userName: messageData.userNames[index], text: messageData.texts[index], date: messageData.dates[index]).onAppear{
                                    if(index == messageData.texts.count - 1) {
                                        self.isMine = false
                                    }
                                }
                            }
                        }.onChange(of: isMine) { _ in
                            if self.isMine == true {
                                proxy.scrollTo(lastId)
                                isMine = false
                            }
                        }
                    }
                }
            }
        }.frame(alignment: .top).frame(minHeight: 0).onAppear() {
            self.messageData.updateData()
        }
    }
}
