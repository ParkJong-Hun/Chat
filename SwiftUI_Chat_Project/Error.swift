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
                Text("Login Fail").bold().font(.title).padding(.bottom, 5)
                Text("Error: \(errorMessage)").font(.footnote)
            }.frame(alignment:.top)
        }
    }
}

/*struct Error_Previews: PreviewProvider {
    @State var sampleStr:String = "Error is it"
    static var previews: some View {
        Error(errorMessage: $sampleStr)
    }
}*/
