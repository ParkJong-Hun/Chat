//
//  MessageData.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/28.
//
import Foundation
import FirebaseAuth
import FirebaseFirestore
//MARK: 데이터베이스에서 가져온 데이터 관리
class MessageData: ObservableObject {
    @Published private(set) var texts:[String] = []
    @Published private(set) var dates:[Date] = []
    @Published private(set) var userNames:[String] = []
    @Published private(set) var uids:[String] = []
    //데이터가 추가될 때마다 갱신
    func updateData() {
        _ = Firestore.firestore().collection("Chat").addSnapshotListener {
            querySnapshot, error in
            self.texts.removeAll()
            self.dates.removeAll()
            self.userNames.removeAll()
            self.uids.removeAll()
            if error != nil {
                //error
            }
            for document in querySnapshot!.documents {
                for data in document.data() {
                    if data.key == "userName" {
                        self.userNames.append(data.value as! String)
                    } else if data.key == "uid" {
                        self.uids.append(data.value as! String)
                    } else if data.key == "text" {
                        self.texts.append(data.value as! String)
                    } else if data.key == "messageDate" {
                        self.dates.append((data.value as! Timestamp).dateValue())
                    }
                }
            }
            print("Updated: \(Date())")
        }
    }
}
