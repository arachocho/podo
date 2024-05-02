//
//  TodoView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    @Environment(\.modelContext)
    private var context
    
    private var todo: Todo
    
    public init(todo: Todo) {
        self.todo = todo
    }
    
    private var todoColor: SelectColor {
        SelectColor(rawValue: todo.color) ?? .orange
    }
    
    @State
    var showingTodoDetail = false
    
    var body: some View {
        NavigationStack{
            HStack(){
                Button(action: toggleCompleted) {
                    Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(todoColor.representable)
                }.buttonStyle(.borderless)
                Text(todo.content)
                    .foregroundColor(todo.completed ? .secondary : .primary)
                Spacer()
                Text("\(todo.priority)")
                Spacer()
                Button(action: {showingTodoDetail = true}) {
                    Image(systemName: "greaterthan")
                        .foregroundColor(todoColor.representable)
                }.buttonStyle(.plain).navigationDestination(isPresented:$showingTodoDetail) { TodoDetailView(todo: todo)}
            }
        }
    }
    
    private func toggleCompleted() {
        todo.completed.toggle()
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

