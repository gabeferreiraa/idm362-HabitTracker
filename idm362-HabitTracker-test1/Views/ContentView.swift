import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme


    var backgroundGradient: LinearGradient {
        if colorScheme == .light {
            return LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.purple]),
                startPoint: .bottom,
                endPoint: .top
            )
        } else {
            return LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.purple]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
    

    var primaryTextColor: Color {
        colorScheme == .light ? Color.white : Color.white
    }
    
    
    var secondaryTextColor: Color {
        colorScheme == .light ? Color.white.opacity(0.8) : Color.white.opacity(0.8)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundGradient
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Welcome to HabitFlow!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(primaryTextColor)
                        .padding(.bottom, 8)
                    
                    Text("Build better habits, one day at a time.")
                        .font(.title3)
                        .foregroundColor(secondaryTextColor)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)
                    
                    Spacer()

                    NavigationLink(destination: MainScreen()) {
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
                    
                    // NavigationLink to MainScreen for guest access.
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
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .previewDisplayName("Light Mode")
            ContentView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
