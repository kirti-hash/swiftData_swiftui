//
//  Item.swift
//  SwiftDataDemo_SwiftUi
//
//  Created by MRT102 on 27/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var title: String
    var timestamp: Date
    
    init(title: String, timestamp: Date) {
        self.title = title
        self.timestamp = timestamp
    }
}
