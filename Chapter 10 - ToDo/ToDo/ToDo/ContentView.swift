//
//  ContentViewTemp.swift
//  ToDo
//
//  Created by Andreas Schultz on 27.09.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

var rowHeight: CGFloat = 60

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: ToDoItems.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItems.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", false))
    
    
    var fetchedItems: FetchedResults<ToDoItems>
    
    @State var newTaskTitle = ""
    
    var sampleTasks = [
        "Task One", "Task Two", "Task Three"
    ]
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedItems, id: \.self) { item in
                    HStack {
                        Text(item.taskTitle ?? "Empty")
                        Spacer()
                        Button(action: {self.markTaskAsDone(at: self.fetchedItems.firstIndex(of: item)!)}) {
                            Image(systemName: "circle")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                    }
                }
                    .frame(height: rowHeight)
                HStack {
                    TextField("Add task...", text: $newTaskTitle, onCommit: {self.saveTask()})
                    Button(action: {self.saveTask()}) {
                       Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                    .frame(height: rowHeight)
                NavigationLink(destination: TasksDone()) {
                    Text("Tasks done")
                    .frame(height: rowHeight)
                }
            }
                .navigationBarTitle(Text("To-Do"))
                .listStyle(GroupedListStyle())
        }
    }
    
    func saveTask() {
        guard self.newTaskTitle != "" else {
            return
        }
        let newToDoItem = ToDoItems(context: self.managedObjectContext)
        newToDoItem.taskTitle = self.newTaskTitle
        newToDoItem.createdAt = Date()
        newToDoItem.taskDone = false
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
        self.newTaskTitle = ""
    }
    
    func markTaskAsDone(at index: Int) {
        let item = fetchedItems[index]
        item.taskDone = true
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
