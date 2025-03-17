//
//  LoginViewModel.swift
//  CashCraft
//
//  Created by omar sillah on 04/03/2025.
//

import Foundation
import SwiftUI
import FirebaseAuth

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var invalidEmailOrPassowrd: String?
    var isValid: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    func validateLogin() {
        invalidEmailOrPassowrd = isValid ? nil : "Please enter a valid email or password"
    }
    
    func login(showLogin: Binding<Bool>){
        // validate the login sign in
        validateLogin()
        Task {
            do {
                let returnUserData = try await FirebaseAuthService().signInUser(email: email, password: password)
                print("Successfully login task")
                print(returnUserData)
                showLogin.wrappedValue = false
            } catch let error as NSError {
                invalidEmailOrPassowrd = "Please enter a valid email or password"
                showLogin.wrappedValue = true
                switch error.code {
                case AuthErrorCode.userNotFound.rawValue:
                    print("No account found with this email")
                case AuthErrorCode.wrongPassword.rawValue:
                    print("Incorrect Password")
                default:
                    print("Login error: \(error.localizedDescription)")
                }
            }
        }
    }
}
