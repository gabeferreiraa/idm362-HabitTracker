import SwiftUI



struct Habit: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var isCompleted: Bool = false
}
// Main View
struct MainScreen: View {
    
    @State private var habits = [
        Habit(name: "Drink 8 glasses of water"),
        Habit(name: "Walk 10,000 steps"),
        Habit(name: "Read for 30 minutes"),
        Habit(name: "Meditate for 10 minutes"),
        Habit(name: "Write in a journal")
    ]
    
    
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
                    ForEach($habits) { $habit in
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
            .navigationTitle("Main Screen")

            .sheet(isPresented: $showingAddHabit) {
                AddHabitView { newHabit in
                    habits.append(newHabit)
                }
            }
        }
    }
    
    // Deletes habits from the list.
    private func deleteHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
}


struct AddHabitView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var habitName: String = ""
    
    // Closure to pass the new habit back.
    var addHabit: (Habit) -> Void
    
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
                        addHabit(Habit(name: habitName))
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
