//
//  TasksDone.swift
//  ToDo
//
//  Created by Andreas Schultz on 26.09.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct TasksDone: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: ToDoItems.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItems.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", true))
    
    var fetchedItems: FetchedResults<ToDoItems>
    
    var body: some View {
        List {
            ForEach(fetchedItems, id: \.self) { item in
                HStack {
                    Text(item.taskTitle ?? "Empty")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
                    .frame(height: rowHeight)
            }
                .onDelete(perform: removeItems)
        }
            .navigationBarTitle(Text("Tasks done"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
    }
    
    func removeItems(at offsets: IndexSet) {
       for index in offsets {
            let item = fetchedItems[index]
            managedObjectContext.delete(item)
        }
        do {
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct TasksDone_Previews: PreviewProvider {
    static var previews: some View {
        TasksDone()
    }
}
