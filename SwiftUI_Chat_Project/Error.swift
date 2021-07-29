//
//  Error.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/22.
//
import SwiftUI
//MARK: 에러 페이지
struct Error: View {
    @Binding var errorMessage:String
    var body: some View {
        NavigationView {
            VStack {
                Text("Login Fail").bold().font(.title).padding(.bottom, 5)
                Text("Error: \(errorMessage)").font(.footnote)
            }.frame(alignment:.top)
        }
    }
}
