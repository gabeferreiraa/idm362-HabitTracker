//
//  MainScreen.swift
//  idm362-HabitTracker
//
//  Created by Gabriel Ferreira on 1/27/25.
//

import SwiftUI

struct MainScreen: View {
    
    @State private var habits = [
        "Drink 8 glasses of water",
        "Walk 10,000 steps",
        "Read for 30 minutes",
        "Meditate for 10 minutes",
        "Write in a journal"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Welcome to HabitFlow!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 8)

            Text("Start building your habits today.")
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.bottom, 16)

            
            Text("Your Habits")
                .font(.headline)
                .padding(.bottom, 8)
            
            List(habits, id: \.self) { habit in
                HStack {
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.blue) 
                    Text(habit)
                        .font(.body)
                }
            }
            .listStyle(PlainListStyle())

            Spacer()

            
            Button(action: {
            
            }) {
                Text("Add a Habit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .padding()
        .navigationTitle("Main Screen")
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
