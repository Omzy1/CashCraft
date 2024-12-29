//
//  InputView.swift
//  CashCraft
//
//  Created by omar sillah on 26/12/2024.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    var imageName: String
    var textfield: String
    var body: some View {
        Label {
            TextField(textfield, text: $text)
                .foregroundColor(.white)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        } icon: {
            Image(systemName: imageName)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.horizontal)
    }
}

#Preview {
    InputView(text: .constant(""), imageName: "at", textfield: "Email ID")
}
