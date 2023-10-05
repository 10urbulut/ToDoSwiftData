//
//  ToDoListView.swift
//  ToDoSwiftData
//
//  Created by Onur Bulut on 4.10.2023.
//

import SwiftUI

struct ToDoListView: View {
    let toDos :[ToDo]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List{
            ForEach(toDos){ toDo in
                NavigationLink(value: toDo) {
                    HStack{
                        Text(toDo.name)
                        Spacer()
                        Text(toDo.priority.description)
                    }
                }
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let todo = toDos[index]
                    context.delete(todo)
                }
            })
            
          
            
        
        }.navigationDestination(for: ToDo.self) { toDo in
            ToDoDetailScreen(toDo: toDo)
        }
    }
}

#Preview {
    ToDoListView(toDos: [ToDo(name: "test", priority: 3)]).modelContainer(for: [ToDo.self])
}
