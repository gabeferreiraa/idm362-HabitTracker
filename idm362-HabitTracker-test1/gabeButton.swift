//
//  gabeButton.swift
//  idm362-HabitTracker-test1
//
//  Created by Gabriel Ferreira on 2/18/25.
//

import SwiftUI

struct gabeButton: View {
    let pTitle: String
    let pImage: String
    let pAction: () -> Void
    
    var body: some View {
        VStack{
            Button(action: {
                pAction()
            }) {Label (pTitle, systemImage: pImage)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    
    gabeButton(
        pTitle: "Holla",
        pImage: "heart.fill",
        pAction: {
            print("Button Tapped")
        })
}
