//
//  ToDoItem.swift
//  SwiftDataDemo_SwiftUi
//
//  Created by MRT102 on 27/10/23.
//

import Foundation
import SwiftData
 
@Model class ToDoItem: Identifiable {
    var id: UUID
    var name: String
    var isComplete: Bool
    
    init(id: UUID = UUID(), name: String = "", isComplete: Bool = false) {
        self.id = id
        self.name = name
        self.isComplete = isComplete
    }
}
