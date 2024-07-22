//
//  ContentView.swift
//  SwiftDataDemo_SwiftUi
//
//  Created by MRT102 on 27/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isTrue = false
    @Query(sort: \Item.title) private var items: [Item]
    @State private var editItem: Item?
    

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric,                           time: .standard))")
//                    } label: {
                    VStack{
                        Text("\(item.title)")
                            .font(.largeTitle)
                            .bold()
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                        // }
                    }
                    .swipeActions{
                        Button {
                            editItem = item
                        } label: {
                            Label("Edit",systemImage: "pencil")
                        }.tint(Color.orange)
                        
                        Button {
                            withAnimation {
                                modelContext.delete(item)
                            }
                        } label: {
                            Label("delete",systemImage: "trash")
                        }.tint(Color.red)
                    }
                    
                    
                    .sheet(item: $editItem){
                        editItem = nil
                    }content: { item in
                        UpdateItem(itemOne: item)
                    }
                  
                }
                
           
                
                
            }
            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            HStack{
                Button(action: {
                    //action
                    print("Button Clicked")
                }, label: {
                    NavigationLink(destination: {
                        NextVC()
                    }, label: {
                        Text("Next View ")
                        
                    })
                    
                })
            }
            Spacer()
        }  detail: {
            Text("Select an item")
            NavigationLink(destination: {
                NextVC()
            }, label: {
                Text("Next View ")
                
            })
        }
        

    }

    private func addItem() {
        withAnimation {
            let newItem = Item(title: "hello", timestamp: Date())
            modelContext.insert(newItem)
            isTrue = true
        }
    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
