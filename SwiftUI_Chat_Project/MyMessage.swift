//
//  MyMessage.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//

import SwiftUI

struct MyMessage: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .trailing) {
                    Text("MyName")
                    Text("2222/22/22 22:22")
                }.font(.footnote)
                Text("This is Text")
                    .font(.title3)
                    .background(Color.black.opacity(0.6).cornerRadius(5))
                    .foregroundColor(.white)
            }
        }.frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct MyMessage_Previews: PreviewProvider {
    static var previews: some View {
        MyMessage()
    }
}
