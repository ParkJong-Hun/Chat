//
//  MyMessage.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//
import SwiftUI
//MARK: 내가 작성한 메시지 UI
struct MyMessage: View {
    var userName:String
    var text:String
    var date:Date
    var dateFormatter:DateFormatter = DateFormatter()
    //생성자
    init(userName:String, text:String, date:Date) {
        self.userName = userName
        self.text = text
        self.date = date
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
    }
    var body: some View {
        VStack {
            HStack {
                //유저 이름, 작성한 시간
                VStack(alignment: .trailing) {
                    Text("\(userName)")
                    Text("\(dateFormatter.string(from: date))")
                }.font(.footnote)
                //작성 내용
                Text("\(text)")
                    .font(.title2)
                    .background(Color.green.opacity(0.6).cornerRadius(5))
                    .foregroundColor(.white)
            }
        }.frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.bottom, 7)
        .padding(.top, 7)
    }
}
