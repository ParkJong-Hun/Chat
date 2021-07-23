//
//  TheyMessage.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//

import SwiftUI

struct TheyMessage:View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("This is Text")
                    .font(.title3)
                    .background(Color.black.opacity(0.3).cornerRadius(5))
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text("TheyName")
                    Text("2222/22/22 22:22")
                }.font(.footnote)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TheyMessage_Previews: PreviewProvider {
    static var previews: some View {
        TheyMessage()
    }
}
