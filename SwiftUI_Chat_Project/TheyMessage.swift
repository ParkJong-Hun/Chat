//
//  TheyMessage.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//

import SwiftUI

struct TheyMessage:View {
    var userName:String
    var text:String
    var date:Date
    var dateFormatter:DateFormatter = DateFormatter()
    
    init(userName:String, text:String, date:Date) {
        self.userName = userName
        self.text = text
        self.date = date
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(text)")
                    .font(.title3)
                    .background(Color.black.opacity(0.3).cornerRadius(5))
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text("\(userName)")
                    Text("\(dateFormatter.string(from: date))")
                }.font(.footnote)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}
