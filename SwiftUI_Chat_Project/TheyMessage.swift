//
//  TheyMessage.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//

import SwiftUI

struct TheyMessage:View {
    @Binding var userName:String
    @Binding var text:String
    @Binding var date:Date
    var dateFormatter:DateFormatter = DateFormatter()
    
    func dateInit() {
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
