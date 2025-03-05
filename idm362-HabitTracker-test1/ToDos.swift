//
//  todos.swift
//  idm362-HabitTracker-test1
//
//  Created by Gabriel Ferreira on 3/4/25.
//

import Foundation
import SwiftData

@Model
class ToDos {
    var id: String
    var name: String
    var isCompleted: Bool = false
    
    init(name: String, isCompleted: Bool? = false) {
        self.id = UUID().uuidString
        self.name = name
    }
}
