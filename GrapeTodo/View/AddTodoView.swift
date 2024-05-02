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
    
    @State
    private var selectedPriority: Priority = .routine
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedPriority, label: Text("우선순위 선택")) {
                              ForEach(Priority.allCases) { priority in
                                  Text(priority.description).tag(priority)
                              }
                          }
                          .pickerStyle(SegmentedPickerStyle())
                          .padding()
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
            color: todoColor,
            priority: selectedPriority
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
