//
//  LoginViewModel.swift
//  CashCraft
//
//  Created by omar sillah on 04/03/2025.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() async throws {
        guard !email.isEmpty , !password.isEmpty else {
            // temporary changes, need proper validation
            print("Please enter a valid email or password")
            return
        }
        
        let returnUserData = try await FirebaseAuthService().signInUser(email: email, password: password)
        
    }
}
