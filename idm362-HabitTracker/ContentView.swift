//
//  ContentView.swift
//  idm362-Gabe
//
//  Created by Gabriel Ferreira on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("gabe_headshot5-copy")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .cornerRadius(20)
                .padding()
            
            Text("My name's Gabe!")
                .font(.title)
                .padding()
            
            Button(action: {
                print("Contacted!")
            }) {
                Text("Contact Me")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(30)
        }
    }
}

#Preview {
    ContentView()
}
