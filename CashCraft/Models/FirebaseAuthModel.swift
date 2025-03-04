//
//  FirebaseAuthModel.swift
//  CashCraft
//
//  Created by omar sillah on 04/03/2025.
//

import Foundation
import FirebaseAuth

struct FirebaseAuthModel {
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}
