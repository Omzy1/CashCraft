//
//  ContentView.swift
//  CashCraft
//
//  Created by omar sillah on 12/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showLoginView: Bool = true
    var body: some View {
        VStack {
            NavigationView {
                if showLoginView {
                    LoginView(showLoginView: $showLoginView)
                } else {
                    HomeView()
                }
            }
        }
        // this is done to show the homeView if you run the app again and if you are already logged in
//        .onAppear {
//            let authUser = try? FirebaseAuthService().getAuthenticatedUser()
//            self.showSignInView = authUser == nil
//        }
    }
}

#Preview {
    ContentView()
}
