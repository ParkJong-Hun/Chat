//
//  Input.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/26.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct Input: View {
    @State var inputText:String = ""
    @State var isEditing:Bool = false
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Rectangle()
                .fill(Color.white)
                .frame(width:30, height: 50)
            TextField("Text me", text: $inputText) {
                isEditing in
                self.isEditing = isEditing
            }
            .frame(height: 50)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/.opacity(0.1), width:1)
            ZStack {
                Rectangle()
                    .fill(Color.green.opacity(0.6))
                .cornerRadius(4.0)
                .shadow(radius: 5.0)
                .frame(width: 60, height: 50)
                Button(action: Submit){
                    Text("전송")
                        .frame(width: 60, height: 50)
                        .foregroundColor(.white)
                }
            }
        }.frame(alignment: .bottom)
    }
    
    func Submit() {
        let date = Date()
        let uid = Auth.auth().currentUser!.uid
        let userName = Auth.auth().currentUser!.displayName ?? "nil"
        let inputSet:[String:Any] = ["meesageDate" : date,
                                     "text" : inputText,
                                     "uid" : uid,
                                     "userName" : userName]
        Firestore.firestore().collection("Chat").document("\(date)_\(uid)").setData(inputSet)
        inputText = ""
    }
}

struct Input_Previews: PreviewProvider {
    static var previews: some View {
        Input()
    }
}
