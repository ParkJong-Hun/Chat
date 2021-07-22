//
//  Chat.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/22.
//

import SwiftUI

struct Chat: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Chat Page")
            }.navigationBarTitle("Chat", displayMode: .inline)
        }
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
