//
//  SignUpViewModel.swift
//  CashCraft
//
//  Created by omar sillah on 04/03/2025.
//

import Foundation

@MainActor
final class SignUpViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUp() {
        guard !email.isEmpty , !password.isEmpty else {
            // temporary changes, need proper validation
            print("Please enter a valid email or password")
            return
        }
        Task {
            do {
                let returnUserData = try await FirebaseAuthService().createUser(email: email, password: password)
                print("Success")
                print(returnUserData)
            } catch {
                print("Erorr: \(error)")
            }
        }
    }
}
