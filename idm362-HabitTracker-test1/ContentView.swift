//  ContentView.swift
//  idm362-HabitTracker
//
//  Created by Gabriel Ferreira on 1/27/25.

import SwiftUI

struct ContentView: View {
    
    @Binding var whichView: String
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                VStack{
                    gabeButton(pTitle: "Main View",
                               pImage: "heart.fill", pAction: {
                        print("Button Tapped!")
                        whichView = "MainView"
                    })
                    gabeButton(pTitle: "Left View",
                               pImage: "arrowshape.left.fill", pAction: {
                        print("Slide to the left!")
                        // Update binded variable
                        whichView = "LeftView"
                    })
                    Text("MainView View!")
                        .font(.largeTitle)
                }
            } // End ZStack
        }
    } // End of view
}

#Preview {
    //ContentView()
    // View switcher with var binding
    @Previewable @State var whichView: String = ""
    return ContentView(whichView: $whichView)
}
