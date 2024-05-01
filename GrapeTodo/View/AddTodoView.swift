//
//  AddView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI
import SwiftData

struct AddTodoView: View {
    
    @Environment(\.modelContext)
    private var context
    
    @Environment(\.dismiss)
    var dismiss
    
    @State
    private var todoName: String = ""
    
    @State
    private var todoColor = SelectColor.red
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("할일 내용 적기", text: $todoName)
                        PriorityColorPicker(selectedColor: $todoColor)
                    }
                }
            }
            .navigationTitle("새로운 Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        save()
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.mini)
                }
            }
            .tint(.orange)
        }
    }
    
    private func save() {
        guard todoName.isEmpty == false else { return }
        
        let newTodo = Todo(
            content: todoName,
            color: todoColor
        )
        context.insert(newTodo)
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        dismiss()
    }
}

#Preview {
    AddTodoView()
}
