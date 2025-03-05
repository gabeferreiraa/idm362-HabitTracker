import SwiftUI
import SwiftData

@Model
class Habit {
    var id: String
    var name: String
    var isCompleted: Bool = false
    
    init(name: String, isCompleted: Bool = false) {
        self.id = UUID().uuidString
        self.name = name
        self.isCompleted = isCompleted
    }
}

// Main View
struct MainScreen: View {
    @Environment(\ .modelContext) private var context
    @Query private var habits: [Habit]
    
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
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
                
                List {
                    ForEach(habits) { habit in
                        HStack(spacing: 12) {
                            if habit.isCompleted {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 20, height: 20)
                            } else {
                                Circle()
                                    .stroke(Color.blue, lineWidth: 2)
                                    .frame(width: 20, height: 20)
                            }
                            
                            Text(habit.name)
                                .font(.body)
                                .strikethrough(habit.isCompleted, color: .green)
                            
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            habit.isCompleted.toggle()
                            try? context.save()
                        }
                    }
                    .onDelete(perform: deleteHabit)
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                Button(action: {
                    showingAddHabit = true
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
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView()
            }
        }
    }
    
    // Deletes habits from the list.
    private func deleteHabit(at offsets: IndexSet) {
        for index in offsets {
            context.delete(habits[index])
        }
        try? context.save()
    }
}

struct AddHabitView: View {
    @Environment(\ .presentationMode) var presentationMode
    @Environment(\ .modelContext) private var context
    @State private var habitName: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Add Habit")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.purple)
                .padding(.top, 20)
            
            TextField("Enter habit name", text: $habitName)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.purple, lineWidth: 2)
                )
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                
                Button(action: {
                    if !habitName.trimmingCharacters(in: .whitespaces).isEmpty {
                        let newHabit = Habit(name: habitName)
                        context.insert(newHabit)
                        try? context.save()
                    }
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
    }
}

// MARK: - Preview
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
