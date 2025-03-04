//
//  AuthServiceProtocol.swift
//  CashCraft
//
//  Created by omar sillah on 04/03/2025.
//

import Foundation
import FirebaseAuth

protocol AuthServiceProtocol {
    // creating user
    func createUser(email: String, password: String) async throws -> FirebaseAuthModel
    //getting user
    func getAuthenticatedUser() throws -> FirebaseAuthModel
    
    func logOut() throws
    
    func signInUser(email: String, password: String) async throws -> FirebaseAuthModel
}
