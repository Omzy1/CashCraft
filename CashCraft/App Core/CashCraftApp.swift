//
//  CashCraftApp.swift
//  CashCraft
//
//  Created by omar sillah on 12/12/2024.
//

import SwiftUI

@main
struct CashCraftApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView()
            } else {
                OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        }
    }
}
