//
//  Message.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//
import SwiftUI
import FirebaseAuth
import FirebaseFirestore
//MARK: 데이터베이스에 있는 각 메시지를 현재 로그인한 유저에 맞춰서 뿌려주기
struct Message: View {
    //Firestore에서 가져온 데이터 관리 객체
    @ObservedObject var messageData:MessageData
    //마지막으로 추가된 메시지가 내가 작성한건지 판별
    @State var isMine:Bool = false
    //스크롤을 바꾸기 위한 위치
    @State var lastId = 0
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    if messageData.texts.count != 0 {
                        ForEach(0..<messageData.texts.count, id: \.self) { index in
                            if(messageData.uids[index] == Auth.auth().currentUser?.uid) {
                                //내 메시지 판별해 렌더링
                                MyMessage(userName: messageData.userNames[index], text: messageData.texts[index], date: messageData.dates[index]).onAppear{
                                    if(index == messageData.texts.count - 1) {
                                        self.isMine = true
                                    }
                                }.id(lastId)
                            } else {
                                //상대 메시지 판별해 렌더링
                                TheyMessage(userName: messageData.userNames[index], text: messageData.texts[index], date: messageData.dates[index]).onAppear{
                                    if(index == messageData.texts.count - 1) {
                                        self.isMine = false
                                    }
                                }
                            }
                        }.onChange(of: isMine) { _ in
                            if self.isMine {
                                print("이동하는 위치 : \(lastId)")
                                proxy.scrollTo(lastId)
                                isMine.toggle()
                            }
                        }
                    }
                }
            }
        }.frame(alignment: .top).frame(minHeight: 0).onAppear() {
            //새 메시지 갱신
            self.messageData.updateData()
        }
    }
}
