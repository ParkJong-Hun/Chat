//
//  Input.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/26.
//
import SwiftUI
import FirebaseFirestore
import FirebaseAuth
//MARK: 내용 작성 UI
struct Input: View {
    @State var inputText:String = ""
    @State var isEditing:Bool = false
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Rectangle()
                .fill(Color.white)
                .frame(width:10, height: 50)
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width:310, height:50)
                    .border(Color.black.opacity(0.1), width:1)
                TextField("Text me", text: $inputText) {
                    isEditing in
                    self.isEditing = isEditing
                }
                .frame(height: 50)
                .offset(x: 15)
            }
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
    //전송 버튼 클릭 시
    func Submit() {
        let date:Date = Date()
        let uid:String = Auth.auth().currentUser!.uid
        let userName:String = Auth.auth().currentUser!.displayName ?? Auth.auth().currentUser!.email as! String
        let inputSet:[String:Any] = ["messageDate" : date,
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
