//
//  UpdateItem.swift
//  SwiftDataDemo_SwiftUi
//
//  Created by MRT102 on 27/10/23.
//

import SwiftUI
import SwiftData

struct UpdateItem: View {
    @Environment (\.dismiss) var dismiss
    @Bindable var itemOne: Item

    
    var body: some View {
        
        List {
            
            DatePicker(
                selection: $itemOne.timestamp,
                displayedComponents: [ .date,.hourAndMinute]
            ) {
                Text(itemOne.timestamp, format: .dateTime) // accessing values
            }
            TextField("Name",text: $itemOne.title) //inputting value
        }
        Button("update"){
            
            dismiss()
        }
        .navigationTitle("Update Timestamp")
    }
   
  
    
}


//#Preview {
//    UpdateItem( itemOne: )
//        .modelContainer(Item.self)
//}
