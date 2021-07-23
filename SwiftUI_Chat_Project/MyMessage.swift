//
//  MyMessage.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//

import SwiftUI

struct MyMessage: View {
    @Binding var userName:String
    @Binding var text:String
    @Binding var date:Date
    var dateFormatter:DateFormatter = DateFormatter()
    
    func dateInit() {
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .trailing) {
                    Text("\(userName)")
                    Text("\(dateFormatter.string(from: date))")
                }.font(.footnote)
                Text("\(text)")
                    .font(.title3)
                    .background(Color.black.opacity(0.6).cornerRadius(5))
                    .foregroundColor(.white)
            }
        }.frame(maxWidth: .infinity, alignment: .trailing)
    }
}
