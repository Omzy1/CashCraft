//
//  LoginView.swift
//  CashCraft
//
//  Created by omar sillah on 26/12/2024.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    // image
                    Image(NSLocalizedString("loginImage", comment: "login Image"))
                        .resizable()
                        .scaledToFit()
                    // login text
                    Text(NSLocalizedString("login_title", comment: "login title"))
                        .padding(.leading)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    InputView(text: $email, imageName: "at", textfield: "Email ID")
                    InputView(text: $password, imageName: "lock", textfield: "Password")
                }
                // login button
                ButtonAuthentication(text: NSLocalizedString("login_title", comment: "button login title"), buttonAction: {
                    print("Login button tapped")
                })
                // line
                LineOrSeperator()
                // Google button login
                ButtonGoogle(text: NSLocalizedString("google_title_button_login", comment: " google title button login"), buttonAction: {
                    print("Google button tapped")
                })
                // Sign up
                HaveAccountButton(text: "Don't have an account?", textisLogin: "Sign Up")
                    .padding(.horizontal)
                Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
