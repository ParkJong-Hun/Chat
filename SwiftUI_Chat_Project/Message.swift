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
    var body: some View {
        VStack {
            if messageData.texts.count != 0 {
                ForEach(0..<messageData.texts.count, id: \.self) { index in
                    if(messageData.uids[index] == Auth.auth().currentUser?.uid) {
                        MyMessage(userName: messageData.userNames[index], text: messageData.texts[index], date: messageData.dates[index])
                    } else {
                        TheyMessage(userName: messageData.userNames[index], text: messageData.texts[index], date: messageData.dates[index])
                    }
                }
            }
        }.frame(alignment: .top).frame(minHeight: 0).onAppear() {self.messageData.updateData()}
    }
}

/*struct Message_Previews: PreviewProvider {
    let messageData = MessageData()
    static var previews: some View {
        Message(messageData: messageData)
    }
}*/
