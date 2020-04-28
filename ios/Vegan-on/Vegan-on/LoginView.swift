//
//  LoginView.swift
//  Vegan-on
//
//  Created by Vincent Bacalso on 28/04/2020.
//  Copyright © 2020 bindevs. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
      
    // MARK: - View
    var body: some View {
      VStack(alignment: .leading, spacing: 15) {
        Text("iOS App Template")
          .font(.largeTitle).foregroundColor(Color.white)
          .padding([.top, .bottom], 40)
        Image("iosapptemplate")
          .resizable()
          .frame(width: 250, height: 250)
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.white, lineWidth: 4))
          .shadow(radius: 10)
          .padding(.bottom, 50)
        TextField("Email", text: self.$email)
          .padding()
          .cornerRadius(20.0)
        SecureField("Password", text: self.$password)
          .padding()
          .cornerRadius(20.0)
        Button(action: {}) {
          Text("Sign In")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.green)
            .cornerRadius(15.0)
        }
      }
        .padding([.leading, .trailing], 27.5)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

