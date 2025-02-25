//
//  SignUp.swift
//  idm362-HabitTracker
//
//  Created by Gabriel Ferreira on 1/27/25.
//

import SwiftUI

struct SignUp: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignedUp: Bool = false // State to track navigation

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    NavigationLink(destination: MainScreen(), isActive: $isSignedUp) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        // Simulating account creation
                        if !username.isEmpty && !email.isEmpty && !password.isEmpty {
                            isSignedUp = true // Triggers NavigationLink
                        }
                    }) {
                        Text("Create Account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationBarTitle("Sign Up", displayMode: .inline)
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
