//
//  ContinueButton.swift
//  CashCraft
//
//  Created by omar sillah on 14/12/2024.
//

import SwiftUI

struct ContinueButton: View {
    var 
    var body: some View {
        Button {
            print("Continue Button clicked")
        } label: {
            Text("Continue")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
        }
        .background(Color.blue)
        .cornerRadius(20)
        .shadow(color: .gray, radius: 5,x: 0, y: 5)
    }
}

#Preview {
    ContinueButton()
}
