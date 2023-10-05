//
//  ContentView.swift
//  ToDoSwiftData
//
//  Created by Onur Bulut on 4.10.2023.
//

import SwiftUI
import SwiftData

struct AddToDoScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var priority: Int?
    
    private var isFormValid : Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty &&
        priority != nil
    }
    
    var body: some View {
        
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                TextField("Priority", value: $priority, format: .number )
            }.navigationTitle("Add ToDo")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Dismiss") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Save") {
                            guard let priority = priority else {return}
                            
                            let todo = ToDo(name: name, priority: priority)
                            
                            context.insert(todo)
                            do{
                                try      context.save()
                            }catch{
                                print(error.localizedDescription)
                            }
                            dismiss()
                        }.disabled(!isFormValid)
                    }
                    
                    
                })
        }
    
    }
}

#Preview {
    
    AddToDoScreen().modelContainer(for: [ToDo.self])
}
