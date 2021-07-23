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
        List {
            VStack(alignment: .trailing){
                MyMessage()
            }
            VStack(alignment: .leading) {
                TheyMessage()
            }
        }
    }
}

struct MyMessage:View {
    var body: some View {
        HStack {
            VStack(alignment: .trailing) {
                Text("MyName")
                Text("2222/22/22 22:22")
            }.font(.footnote)
            Text("This is Text").clipShape(RoundedRectangle(cornerRadius: 25)).background(Color.gray).foregroundColor(.white)
        }
    }
}
struct TheyMessage:View {
    var body: some View {
        HStack {
            Text("This is Text").clipShape(RoundedRectangle(cornerRadius: 25)).background(Color.gray.opacity(0.5)).foregroundColor(.white)
            VStack(alignment: .leading) {
                Text("TheyName")
                Text("2222/22/22 22:22")
            }.font(.footnote)
        }
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
