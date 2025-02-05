import SwiftUI

// Create a data model
class UserData: ObservableObject {
    @Published var index: Int = 0
}

struct MainView: View {
    @StateObject var userData = UserData()
    var body: some View {
        ContentView()
        TabView {
            // Home Tab
            Text("Welcome to the Home Tab!")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            // About Tab
            Text("Learn more about us on the About Tab. User Picked: \(userData.index)")
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
            
            // Settings Tab
            Text("Customize your experience in the Settings Tab.")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .environmentObject(userData)
        }
        
    }
}

#Preview {
    MainView()
    // Make UserData available
        .environmentObject(UserData())
}
