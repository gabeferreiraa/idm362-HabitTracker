//
//  ContentView.swift
//  idm362-HabitTracker
//
//  Created by Gabriel Ferreira on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme // Detects system appearance

    var body: some View {
        NavigationView {
            ZStack {
                // Dynamic gradient based on color scheme
                LinearGradient(
                    gradient: Gradient(colors: colorScheme == .dark
                        ? [Color.blue, Color.purple] // Dark mode
                        : [Color.blue, Color.white] // Light mode
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Welcome to HabitFlow!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 8)
                    
                    Text("Build better habits, one day at a time.")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)
                    
                    Spacer()
                    
                    // NavigationLink to SignUp screen
                    NavigationLink(destination: SignUp()) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                    // NavigationLink to MainScreen
                    NavigationLink(destination: MainScreen()) {
                        Text("Continue as guest")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark) // Preview in dark mode
        ContentView()
            .preferredColorScheme(.light) // Preview in light mode
    }
}
