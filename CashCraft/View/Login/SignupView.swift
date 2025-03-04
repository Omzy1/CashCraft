//
//  SignupView.swift
//  CashCraft
//
//  Created by omar sillah on 26/01/2025.
//

import SwiftUI

struct SignupView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewmodel = SignUpViewModel()
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Image(NSLocalizedString("signup_image", comment: "Sign up Image"))
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading, spacing: 8) {
                    Text(NSLocalizedString("signup_title", comment: " Sign up text"))
                        .padding(.leading)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    InputView(text: $viewmodel.email, imageName: "at", textfield: "Email ID")
                    InputView(text: $viewmodel.password, imageName: "lock", textfield: "Password")
                }
                // login button
                ButtonAuthentication(text: NSLocalizedString("signup_title", comment: "button signup title"), buttonAction: {
                    viewmodel.signUp()
                    print("Signup button tapped")
                })
                // line
                LineOrSeperator()
                // Google button login
                ButtonGoogle(text: NSLocalizedString("google_title_button_signup", comment: " google title button login"), buttonAction: {
                    print("Google button tapped")
                })
                
                // Sign up
                HStack {
                    Text(NSLocalizedString("already_account", comment: "already have an account?"))
                        .foregroundColor(.black.opacity(0.5))
                    Button(action: {
                        self.dismiss()
                    }, label: {
                        Text(NSLocalizedString("login_title", comment: " button login text"))
                    })
                    .padding(.horizontal)
                }
                // hiding back button
                .navigationBarBackButtonHidden(true)
                .transition(.slide)
                Spacer()
            }
        }
    }
}

#Preview {
    SignupView()
}
