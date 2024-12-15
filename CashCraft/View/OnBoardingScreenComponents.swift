//
//  OnBoardingScreenComponents.swift
//  CashCraft
//
//  Created by omar sillah on 14/12/2024.
//

import SwiftUI

struct OnBoardingScreenComponents: View {
    var title: String
    var subTitle: String
    var image: Image
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.semibold)
            .padding()
        Text(subTitle)
            .font(.title2)
            .fontWeight(.regular)
        
        Spacer()
            image
            .resizable()
            .scaledToFit()
        
    }
}

#Preview {
    OnBoardingScreenComponents(title: "Plan Your Spending", subTitle: "Achieve Your Goals", image: Image("OnBoardingCreatingAccount"))
}
