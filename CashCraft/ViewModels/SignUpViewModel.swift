//
//  SignUpViewModel.swift
//  CashCraft
//
//  Created by omar sillah on 04/03/2025.
//

import Foundation

@MainActor
final class SignUpViewModel: ObservableObject {
    // email and password the user enter in the field
    @Published var email: String = ""
    @Published var password: String = ""
    
    // validation email and password error string
    @Published var emailError: String? = ""
    @Published var passwordError: String? = ""
    
    struct PasswordRequirments {
        var hasMinLength: Bool
        var hasUpperCase: Bool
        var hasLowerCase: Bool
        var hasNumber: Bool
        var hasSpecialCase: Bool
        
        var isValid: Bool {
            hasMinLength && hasUpperCase && hasLowerCase && hasNumber && hasSpecialCase
        }
    }
    // Form validation state
      var isFormValid: Bool {
          emailError == nil && passwordError == nil && !email.isEmpty && !password.isEmpty
      }
    
    // validation for password
    private func checkPasswordRequirments() -> PasswordRequirments {
        return PasswordRequirments(hasMinLength: password.count >= 6,
                                   hasUpperCase: password.rangeOfCharacter(from: .uppercaseLetters) != nil,
                                   hasLowerCase: password.rangeOfCharacter(from: .lowercaseLetters) != nil,
                                   hasNumber: password.rangeOfCharacter(from: .decimalDigits) != nil,
                                   hasSpecialCase: password.rangeOfCharacter(from: .symbols) != nil
        )
    }
    //the message validation for password
    func validatePassword() {
        let requirments = checkPasswordRequirments()
        
        if requirments.isValid {
            passwordError = nil
        } else {
            var errors = [String]()
            if !requirments.hasMinLength {errors.append("at least 6 characters")}
            if !requirments.hasUpperCase {errors.append("an uppercase letter")}
            if !requirments.hasLowerCase {errors.append("an lowercase letter")}
            if !requirments.hasNumber {errors.append("a number")}
            if !requirments.hasSpecialCase {errors.append("a special character")}
            
            passwordError = "Password must contain:\n" + errors.joined(separator: ", ")
        }
    }
    // validating email using regex
    func validateEmail() {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let result = email.range(of: emailPattern, options: .regularExpression)
        emailError = (result == nil || email.isEmpty) ? "Please enter a valid email" : nil
    }
    // create a user if it is successful
    func signUp() {
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
