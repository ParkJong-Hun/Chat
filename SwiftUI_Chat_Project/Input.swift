//
//  Input.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/26.
//

import SwiftUI

struct Input: View {
    @State var inputText:String = ""
    @State var isEditing:Bool = false
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            TextField("Text me", text: $inputText) {
                isEditing in
                self.isEditing = isEditing
            }
            .frame(height: 50)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/.opacity(0.1), width:1)
            Button(action: {}){
                Text("전송")
                    .frame(width: 60, height: 50)
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }.frame(alignment: .bottom)
    }
}

struct Input_Previews: PreviewProvider {
    static var previews: some View {
        Input()
    }
}
