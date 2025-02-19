//
//  MainView.swift
//  idm362-HabitTracker-test1
//
//  Created by Gabriel Ferreira on 2/18/25.
//

import SwiftUI

//

struct MainView: View {
    
    // View Switcher with a variable binding
    @State private var whichView: String = ""
    
    // View switcher with var binding
    
    var body: some View {
        switch whichView {
        case "left":
            LeftView(whichView: $whichView)
        default:
            ContentView(whichView: $whichView)
        }
        
        
    } // End of view
    
}

#Preview {
    MainView()
}
