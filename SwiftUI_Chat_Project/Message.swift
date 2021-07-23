//
//  Message.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/23.
//

import SwiftUI

struct Message: View {
    @State var Message:[String] = []
    var body: some View {
        VStack(alignment: .trailing) {
            MyMessage()
            TheyMessage()
        }.frame(maxWidth: .infinity)
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
