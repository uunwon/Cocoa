//
//  ContentView.swift
//  SignInWithApple
//
//  Created by uunwon on 4/29/24.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @State private var userName: String = ""
    @State private var userEmail: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            if userName.isEmpty {
                SignInWithAppleButton(.signIn,
                                      onRequest: onRequest,
                                      onCompletion: onCompletion)
                .signInWithAppleButtonStyle(.black)
                .frame(width: 200, height: 50)
            } else {
                Text("Welcome\n\(userName), \(userEmail)")
                    .foregroundStyle(.black)
                    .font(.headline)
            }
        }
    }
    
    private func onRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    private func onCompletion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authResult):
            // ✨ guard let: 실행시키기 위해 조건을 검사, if 보다 표현이 명확 ❤️‍🩹
            // https://declan.tistory.com/61
            guard let credential = authResult.credential as? ASAuthorizationAppleIDCredential
            else { return } // guard 조건문이 false 일 때 실행
            // guard 조건문이 true 일 때 실행
            // TODO: store Data
            
        case .failure(let error):
            print("Authorization failed: " + error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
