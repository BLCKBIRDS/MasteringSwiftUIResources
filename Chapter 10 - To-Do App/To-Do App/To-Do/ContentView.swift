//File: ContentView.swift
//Project: To-Do

//Created at 13.04.20 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.

import SwiftUI
import CoreData

var rowHeight: CGFloat = 50

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: ToDoItems.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItems.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", false))
    
    var fetchedItems: FetchedResults<ToDoItems>
    
    @State var newTaskTitle = ""

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
                    .onDelete(perform: removeItems)
                    .frame(height: rowHeight)
                HStack {
                    TextField("Add task...", text: $newTaskTitle, onCommit: {
                        print("New task title entered.")
                    })
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
                .navigationBarItems(trailing: EditButton())
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

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return ContentView().environment(\.managedObjectContext, context)
    }
}
