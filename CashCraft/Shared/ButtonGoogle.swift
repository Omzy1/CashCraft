//
//  ButtonGoogle.swift
//  CashCraft
//
//  Created by omar sillah on 26/12/2024.
//

import SwiftUI

struct ButtonGoogle: View {
    var text: String
    var buttonAction: () -> Void
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            Label(text, image: NSLocalizedString("google_logo_image", comment: "google logo image"))
                .scaledToFit()
                .font(.headline)
                .foregroundColor(.black.opacity(0.7))
                
                
        })
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding()
        .padding(.horizontal)
    }
}

#Preview {
    ButtonGoogle(text: "Login with Googole", buttonAction: {
        print("PREV: Google tapped")
    }
    )
}
