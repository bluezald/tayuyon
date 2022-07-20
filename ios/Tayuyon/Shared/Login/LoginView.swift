//
//  LoginView.swift
//  Tayuyon (iOS)
//
//  Created by Vincent Bacalso on 7/19/22.
//

import SwiftUI

struct LoginView: View {
  @State private var email = ""
  @State private var password = ""
  
  var body: some View {
    VStack(alignment: .center, spacing: 15) {
      Spacer()
      TitleView()
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
      HStack(spacing: 10) {
        CircleButton(
          text: "FB",
          foregroundColor: Color.white,
          backgroundColor: Color.blue
        )
        CircleButton(
          text: "G",
          foregroundColor: Color.white,
          backgroundColor: Color.red
        )
      }
      Spacer()
    }
    .padding([.leading, .trailing], 27.5)
  }
  
  struct TitleView: View {
    var body: some View {
      VStack(alignment: .center) {
        Image("AppLogoWithText")
          .resizable()
          .frame(width: 250, height: 80, alignment: .center)
          .aspectRatio(contentMode: .fit)
        Text("Easily transition to a more sustainable living")
          .font(.title2)
          .frame(width: 300)
          .multilineTextAlignment(.center)
        Text("Tayuyon would like to request for your location so it can point you to the right sustainable places")
          .font(.subheadline)
          .multilineTextAlignment(.center)
      }
    }
  }
  
  struct CircleButton: View {
    var text: String = "Button"
    var foregroundColor: Color = Color.white
    var backgroundColor: Color = Color.black
    
    var body: some View {
      Button(action: {
      }) {
        Text(text)
          .frame(width: 50, height: 50)
          .foregroundColor(foregroundColor)
          .background(backgroundColor)
          .clipShape(Circle())
      }
    }
  }
  
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
