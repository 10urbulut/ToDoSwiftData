//
//  ToDo.swift
//  ToDoSwiftData
//
//  Created by Onur Bulut on 4.10.2023.
//

import Foundation
import SwiftData

@Model
final class ToDo {
    var name : String
    var priority : Int
    
    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
    }
}
