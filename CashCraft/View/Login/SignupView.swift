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
    // show the validation password text only after the user enter a word
    @State private var showText: Bool = false
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Section {
                    Image(NSLocalizedString("signup_image", comment: "Sign up Image"))
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .leading, spacing: 8) {
                        Text(NSLocalizedString("signup_title", comment: " Sign up text"))
                            .padding(.leading)
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        if let emailError = viewmodel.emailError {
                            Text(emailError)
                                .foregroundColor(.red)
                                .bold()
                                .font(.caption)
                                .padding(.horizontal)
                                .padding(.horizontal)
                        }
                        //  email field
                        InputView(text: $viewmodel.email, imageName: "at", textfield: "Email ID")
                            .onChange(of: viewmodel.email) {
                                // validate email while user typing
                                viewmodel.validateEmail()
                            }
                        // password validation error
                        if let passwordError = viewmodel.passwordError {
                            if showText {
                                Text(passwordError)
                                    .foregroundColor(.red)
                                    .bold()
                                    .font(.caption)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                    .padding(.horizontal)
                            }
                            
                        }
                        // password field
                        InputView(text: $viewmodel.password, imageName: "lock", textfield: "Password")
                            .onChange(of: viewmodel.password) {
                                viewmodel.validatePassword()
                                showText = true
                            }
                    }
                }
                Section {
                    // login button
                    ButtonAuthentication(text: NSLocalizedString("signup_title", comment: "button signup title"), buttonAction: {
                        viewmodel.signUp()
                        print("Signup button tapped")
                    })
                }
                .disabled(!viewmodel.isFormValid)
                Section {
                    // line
                    LineOrSeperator()
                    // Google button login
                    ButtonGoogle(text: NSLocalizedString("google_title_button_signup", comment: " google title button login"), buttonAction: {
                        print("Google button tapped")
                    })
                }
                
                Section {
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
}

#Preview {
    SignupView()
}
