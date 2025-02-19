//
//  LeftView.swift
//  idm362-HabitTracker-test1
//
//  Created by Gabriel Ferreira on 2/18/25.
//

import SwiftUI

struct LeftView: View {
    
    // View Switcher with a variable binding
    @State private var whichView: String = ""
    
    var body: some View {
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
            Text("Left View!")
                .font(.largeTitle)
        }
    }
}

#Preview {
    //LeftView()
    // View switcher with var binding
    @Previewable @State var whichView: String = ""
    return ContentView(whichView: $whichView)
}
