//
//  TheyMessage.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//
import SwiftUI
//MARK: 다른 사람이 작성한 메시지 UI
struct TheyMessage:View {
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
        VStack(alignment: .leading) {
            HStack {
                //작성한 내용
                Text("\(text)")
                    .font(.title2)
                    .background(Color.black.opacity(0.3).cornerRadius(5))
                    .foregroundColor(.white)
                //유저 이름, 작성한 시간
                VStack(alignment: .leading) {
                    Text("\(userName)")
                    Text("\(dateFormatter.string(from: date))")
                }.font(.footnote)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 7)
        .padding(.top, 7)
    }
}
