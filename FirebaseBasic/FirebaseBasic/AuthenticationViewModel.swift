//
//  AuthenticationViewModel.swift
//  FirebaseBasic
//
//  Created by uunwon on 4/29/24.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

@Observable
final class AutenticationViewModel {
    enum State {
        case busy // 중간 단계를 의미함 로그인 "중", 로그아웃 "중"
        case signedIn
        case signedOut
    }
    
    var state: State = .busy
    private var authResult: AuthDataResult? = nil
    var username: String { authResult?.user.displayName ?? "" }
    var email: String { authResult?.user.email ?? "" }
    var photoURL: URL? { authResult?.user.photoURL }
    
    func logout() {
        
    }
    
    func restorePreviousSignIn() {
        
    }
    
    func login() {
        
    }
    
    private func signIn(user: GIDGoogleUser?) async {
        
    }
}
