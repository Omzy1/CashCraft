//
//  ButtonAuthentication.swift
//  CashCraft
//
//  Created by omar sillah on 26/12/2024.
//

import SwiftUI

struct ButtonAuthentication: View {
    var text: String
    var buttonAction: () -> Void
    var body: some View {
        VStack {
            Button(action: {
                buttonAction()
            }) {
                Text(text)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ButtonAuthentication(text: "Login", buttonAction: {
        print("Button Login tapped")
    })
}
