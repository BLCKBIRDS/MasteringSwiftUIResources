//File: TasksDone.swift
//Project: To-Do

//Created at 13.04.20 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.

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
        }
            .navigationBarTitle(Text("Tasks done"))
            .listStyle(GroupedListStyle())
    }
}

struct TasksDone_Previews: PreviewProvider {
    static var previews: some View {
        TasksDone()
    }
}
