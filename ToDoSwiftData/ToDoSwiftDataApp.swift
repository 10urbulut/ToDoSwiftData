//
//  ToDoSwiftDataApp.swift
//  ToDoSwiftData
//
//  Created by Onur Bulut on 4.10.2023.
//

import SwiftUI

@main
struct ToDoSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            
            NavigationStack{
                ListScreen()
            }
      
        }.modelContainer(for: [ToDo.self])
    }
}
