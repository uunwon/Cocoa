//
//  ContentView.swift
//  FirebaseBasic
//
//  Created by uunwon on 4/29/24.
//

import SwiftUI
import GoogleSignInSwift

struct ContentView: View {
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        ZStack {
            // safearea 상관없이 흰색으로 칠하기
            Color.white.ignoresSafeArea(.all)
            
            switch authenticationViewModel.state {
            case .busy:
                ProgressView()
            case .signedIn:
                ProfileView(authenticationViewModel: authenticationViewModel)
            case .signedOut:
                GoogleSignInButton(action: authenticationViewModel.login)
                    .frame(width: 150, height: 30, alignment: .center)
            }
        }
        .task {
            authenticationViewModel.restorePreviousSignIn()
        }
    }
}

#Preview {
    ContentView()
}
