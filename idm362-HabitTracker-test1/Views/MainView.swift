import SwiftUI

struct GradientBackground: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        
        let gradient: LinearGradient = {
            if colorScheme == .light {
                return LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.purple]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            } else {
                return LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        }()
        
        return gradient
            .ignoresSafeArea()
    }
}

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme


    var textColor: Color {
        colorScheme == .light ? .blue : .white
    }
    

    var buttonColor: Color {
        colorScheme == .light ? Color.purple : Color.blue
    }
    
    var body: some View {
        TabView {
            // Home Tab with ContentView
            NavigationView {
                ContentView()
                    .navigationBarHidden(true)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            

            NavigationView {
                ZStack {
                    GradientBackground()
                    
                    VStack {
                        Spacer()
                        
                        Text("""
                        Habit Tracker was founded by Gabriel Ferreira with the mission of helping people form healthy habits. By tracking your daily routines, setting achievable goals, and celebrating progress, our app empowers you to embrace a healthier lifestyle. Whether you're working on fitness, mindfulness, or personal growth, Habit Tracker is your companion on the journey to a better you.
                        """)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding(.horizontal)
                        
                        Spacer()

                        Button(action: {
                        }) {
                            Text("Learn More")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(buttonColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .padding(.bottom, 20)
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Label("About", systemImage: "info.circle")
            }
        }
        .accentColor(textColor)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .preferredColorScheme(.light)
                .previewDisplayName("Light Mode")
            MainView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
