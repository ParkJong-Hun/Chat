//
//  Login.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/22.
//
import SwiftUI
import FirebaseAuth
//MARK: 로그인 페이지
struct Login: View {
    //github를 이용하기 위해 provider 가져옴
    var provider = OAuthProvider(providerID: "github.com")
    //Firebase의 Auth를 이용하기 위한 객체 생성
    var auth = Auth.auth()
    //에러 메세지
    @State var errorMessage:String = ""
    //로그인 성공적으로 되었는가
    @State var isSigned = false
    //에러가 발생했는가
    @State var isError = false
    var body: some View {
            NavigationView() {
                ZStack {
                    VStack {
                        //로그인 버튼
                        Button(action: LoginButtonClick) {
                            Text("GITHUB LOGIN")
                                .frame(width:200, height:60)
                                .font(.title2)
                                .background(Color.black.opacity(0.6))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                    //채팅 페이지로 이동
                    NavigationLink(
                        destination: Chat().navigationBarHidden(true),
                        isActive: $isSigned
                    ) {
                        EmptyView()
                    }
                    //에러 페이지로 이동
                    NavigationLink(
                        destination: Error(errorMessage: $errorMessage),
                        isActive: $isError
                    ) {
                        EmptyView()
                    }
                }.navigationBarTitle("Simple Chat", displayMode: .inline)
            }
    }
    //로그인 버튼 클릭 시
    func LoginButtonClick() {
        //provider에서 credential을 가져옴
        provider.getCredentialWith(nil) { credential, error in
            //에러일 때
            if error != nil {
                isSigned = false
                isError = true
                errorMessage = error.debugDescription
            }
            //Credential 있음
            if credential != nil {
                //로그인 시작
                auth.signIn(with: credential!) { authResult, error in
                    //에러일 때
                    if error != nil {
                        isSigned = false
                        isError = true
                        errorMessage = error.debugDescription
                    } else {
                        isSigned = true
                    }
                    //유저 로그인됨
                    guard (authResult?.credential! as? OAuthCredential) != nil else { return
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
