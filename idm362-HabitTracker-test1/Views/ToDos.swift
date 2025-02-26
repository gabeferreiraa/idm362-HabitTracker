//
//  ToDos.swift
//  idm362-HabitTracker-test1
//
//  Created by Gabriel Ferreira on 2/25/25.
//
// Swift Data 2023 - iOS 17 or newer
// importing SwiftData
// @Model
// class

import Foundation
import SwiftData

@Model
class ToDos {
    var id: String
    var name: String
    var isCompleted: Bool = false
    
    init( name: String, isCompleted: Bool? = false) {
        self.id = UUID().uuidString
        self.name = name
    }
}


