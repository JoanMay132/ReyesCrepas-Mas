//
//  AuthenticationView.swift
//  Reyes Crepas
//
//  Created by Joan May on 27/06/25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift





@MainActor
final class AuthenticationViewModel : ObservableObject {
    
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)

        
    }
}

struct AuthenticationView: View {
    
   @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        
        
        VStack {
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign Up With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            // Google sign in button
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide,state: .normal)) {
                Task {
                    do {
                        try await viewModel.signInGoogle()
                        showSignInView = false
                    }catch {
                        print(error)
                    }
                }
            }
            Spacer()

            
        }
        .padding()
        .navigationTitle("Sign In")
        

        .padding()
    }
}


struct AuthenticationView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView(showSignInView: .constant(false ))
        }
        
    }
}
