//
//  Login.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/21.
//

import SwiftUI

struct Login: View {
    var body: some View {
        NavigationView() {
            Button(action: Login) {
                Text("GITHUB LOGIN")
                    .frame(width:200, height:60)
                    .font(.title2)
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }.navigationBarTitle("Simple Chat", displayMode: .inline)
        }
    }
    
    func Login() {
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
