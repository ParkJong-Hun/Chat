//
//  Login.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/22.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth

struct Login: View {
    //github를 이용하기 위해 provider 가져옴
    var provider = OAuthProvider(providerID: "github.com")
    //Firebase의 Auth를 이용하기 위한 객체 생성
    let auth = Auth.auth()
    
    var body: some View {
        NavigationView() {
            Button(action: LoginButtonClick) {
                Text("GITHUB LOGIN")
                    .frame(width:200, height:60)
                    .font(.title2)
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }.navigationBarTitle("Simple Chat", displayMode: .inline)
        }
    }
    
    func LoginButtonClick() {
        provider.getCredentialWith(nil) { credential, error in
            if error != nil {
                //에러
            }
            if credential != nil {
                auth.signIn(with: credential!) { authResult, error in
                    if error != nil {
                        //에러
                    }
                    //유저 로그인됨
                    guard let oauthCredential = authResult?.credential! as? OAuthCredential else { return
                        //OAuth access Token 내용
                    }
                }
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
