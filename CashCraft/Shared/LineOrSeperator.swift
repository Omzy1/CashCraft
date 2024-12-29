//
//  LineOrSeperator.swift
//  CashCraft
//
//  Created by omar sillah on 26/12/2024.
//

import SwiftUI

struct LineOrSeperator: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(height: 1)
            Text("OR")
                .foregroundColor(.gray)
                .fontWeight(.semibold)
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(height: 1)
        }
        .padding()
    }
}

#Preview {
    LineOrSeperator()
}
