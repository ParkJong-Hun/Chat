//
//  Error.swift
//  SwiftUI_Chat_Project
//
//  Created by 박종훈 on 2021/07/22.
//

import SwiftUI

struct Error: View {
    @Binding var errorMessage:String
    var body: some View {
        NavigationView {
            VStack {
                Text("로그인 중 에러가 발생하였습니다. 네트워크 연결 상태를 확인하시고 다시 시도해주시기 바랍니다.").bold().font(.title)
                Spacer()
                Text("Error: \(errorMessage)")
            }.navigationBarTitle("Error", displayMode: .inline)
        }
    }
}

/*struct Error_Previews: PreviewProvider {
    @State var sampleStr:String = "Error is it"
    static var previews: some View {
        Error(errorMessage: $sampleStr)
    }
}*/
