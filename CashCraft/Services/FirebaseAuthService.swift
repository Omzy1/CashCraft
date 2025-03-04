//
//  FirebaseAuthService.swift
//  CashCraft
//
//  Created by omar sillah on 04/03/2025.
//

import Foundation
import FirebaseAuth

final class FirebaseAuthService: AuthServiceProtocol {
    
    func createUser(email: String, password: String)  async throws  -> FirebaseAuthModel {
       let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return FirebaseAuthModel(user: authDataResult.user)
    }
    
    func getAuthenticatedUser() throws -> FirebaseAuthModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return FirebaseAuthModel(user: user)
    }
    
    func logOut() throws {
       try Auth.auth().signOut()
    }
    
    func signInUser(email: String, password: String) async throws -> FirebaseAuthModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return FirebaseAuthModel(user: authDataResult.user)
    }
}
