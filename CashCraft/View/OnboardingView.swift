//
//  OnboardingView.swift
//  CashCraft
//
//  Created by omar sillah on 14/12/2024.
//

import SwiftUI

struct OnboardingView: View {
    /// Determine if we have seen the onboarding screen at lest once
    @Binding var hasSeenOnboarding: Bool
    /// keep track of the current screen
    @State var currentScreen = 1
    
    /// store all the content information in the onboarding screens
    var contentInfo: [String: String] = [
        // first onboarding
        "title1" : NSLocalizedString("onboarding_screenOne_title", comment: "The title for the first screen in onboarding"),
        "subtitle1" : NSLocalizedString("onboarding_screenOne_subtitle", comment: "The subtilte of the first screen in onboarding"),
        "image1": NSLocalizedString("imageOnboarding_screenOne", comment: "image of the first screen in onboarding"),
        // sencond onboarding
        "title2" : NSLocalizedString("onboarding_screenTwo_title", comment: "The title for the second screen in onboarding"),
        "subtitle2" : NSLocalizedString("onboarding_screenTwo_subtitle", comment: "The subtilte of the second screen in onboarding"),
        "image2": NSLocalizedString("imageOnboarding_screenTwo", comment: "image of the second screen in onboarding"),
        // third onboarding
        "title3" : NSLocalizedString("onboarding_screenThree_title", comment: "The title for the third screen in onboarding"),
        "subtitle3" : NSLocalizedString("onboarding_screenThree_subtitle", comment: "The subtilte of the third screen in onboarding"),
        "image3": NSLocalizedString("imageOnboarding_screenThree", comment: "image of the third screen in onboarding"),
        "button_continue": NSLocalizedString("button_continue", comment: "Continue button label"),
        "button_getStarted":  NSLocalizedString("button_getStarted", comment: "get started button label"),
    ]
    var body: some View {
        VStack {
            Spacer()
            // shows different onboarding screen
            if currentScreen == 1 {
                OnBoardingScreenComponents(title: contentInfo["title1"] ?? "", subTitle: contentInfo["subtitle1"] ?? "" , image: Image(contentInfo["image1"] ?? "clock.fill"))
            } else if  currentScreen == 2 {
                OnBoardingScreenComponents(title: contentInfo["title2"] ?? "", subTitle: contentInfo["subtitle2"] ?? "" , image: Image(contentInfo["image2"] ?? "clock.fill"))
            } else if currentScreen == 3 {
                OnBoardingScreenComponents(title: contentInfo["title3"] ?? "", subTitle: contentInfo["subtitle3"] ?? "" , image: Image(contentInfo["image3"] ?? "clock.fill"))
            }
            
            Spacer()
            // continue/get started button
            Button {
                // keeping track of the current screen
                if currentScreen == 3 {
                    hasSeenOnboarding = true
                }
                if currentScreen < 3{
                    currentScreen += 1 // move to the next screen
                }
                
            } label: {
                Text((currentScreen == 3 ? contentInfo["button_getStarted"] : contentInfo["button_continue"]) ?? "Continue")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
            }
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 5,x: 0, y: 5)
            Spacer()
        }
    }
}

#Preview {
    OnboardingView(hasSeenOnboarding: .constant(true)) // use constant to make binding previews
}
