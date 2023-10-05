//
//  ListView.swift
//  ToDoSwiftData
//
//  Created by Onur Bulut on 4.10.2023.
//

import SwiftUI
import SwiftData


struct ListScreen: View {
    
    @Query(sort: \ToDo.name, order: .forward) private var toDos : [ToDo]
    
    @State private var isAtToDoPresented : Bool = false
    var body: some View {
        
            ToDoListView(toDos: toDos)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add ToDo") {
                        isAtToDoPresented = true
                    }
                }
            }).sheet(isPresented: $isAtToDoPresented, content: {
                NavigationStack{
                    AddToDoScreen()
                }
            })
        
        
     
    }
}

#Preview {
    NavigationStack{
        ListScreen()
            .modelContainer(for: [ToDo.self])
    }

}
