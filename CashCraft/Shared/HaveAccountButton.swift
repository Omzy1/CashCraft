//
//  HaveAccountButton.swift
//  CashCraft
//
//  Created by omar sillah on 26/12/2024.
//

import SwiftUI

struct HaveAccountButton: View {
    var text: String
    var textisLogin: String
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.black.opacity(0.5))
                    Button(action: {
            
                    }, label: {
                        Text(textisLogin)
                    })
        }
    }
}

#Preview {
    HaveAccountButton(text: "Don't have an account?", textisLogin: "Sign Up")
}
