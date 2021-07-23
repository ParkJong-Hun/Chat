//
//  Message.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//

import SwiftUI

struct Message: View {
    @State var texts:[String] = ["This is Text", "This is Text2"]
    @State var userNames:[String] = ["Me", "Johns"]
    @State var dates:Date = Date()
    var body: some View {
        VStack {
            ForEach(userNames, id: \.self) { userName in
                if(userName == "Me") {
                    MyMessage(userName: $userNames[0], text: $texts[0], date: $dates)
                } else {
                    TheyMessage(userName: $userNames[1], text: $texts[1], date: $dates)
                }
            }
        }.frame(alignment: .top)
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
