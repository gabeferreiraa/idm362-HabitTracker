// ContentView.swift
// Simplified View with Circular Image Placeholder

import SwiftUI
import SwiftData



struct ContentView: View {
    // Content for working containers
    
    @Environment(\.modelContext) private var context

    // Query for any changes to the ToDos model - class
    
    @Query private var ToDosOBJ: [ToDos]
    var body: some View {
        VStack(spacing: 16) {
            // Circular image placeholder
            Image(systemName: "person.circle") // replace with your own image
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            // Small text underneath
            Text("Beabadoobee")
                .font(.footnote)
                .foregroundColor(.gray)
            Button("Add a string") {
                let oneItem = ToDos(name: "MEDIA", isCompleted: false)
                // Autosave to SwiftData model - class
                context.insert(oneItem)
                try? context.save()
            }
            List {
                ForEach(ToDosOBJ) { item in
                    Text(item.name)
                }
                .onDelete {
                    indexes in for ndx in indexes {
                        context.delete(ToDosOBJ[ndx])
                        
                    }
                }
            }

            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
