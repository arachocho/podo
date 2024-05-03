//
//  AddView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.modelContext)
    private var context
    
    @Environment(\.dismiss)
    var dismiss
    
    @State
    private var todoName: String = ""
    
    @State
    private var todoContent: String = ""
    
    @State
    private var todoColor = SelectColor.red
    
    @State
    private var selectedPriority: Priority = .routine
    
    var body: some View {
        NavigationView {
            VStack {
//                Picker(selection: $selectedPriority, label: Text("우선순위 선택")) {
//                    ForEach(Priority.allCases) { priority in
//                        Text(priority.description).tag(priority)
//                    }
                
//                struct MenuButtonView: View {
//                    var body: some View {
//                        ZStack {
//                            Menu("Choose a priority") {
//                                Button("Low") { print("Select Low”) }
//                                Button("High") { print("Select High") }
//                                Button("Routine") { print("Select Routine") }
//                            }
//                        }.foregroundColor(.black)
//                    }
//                }
                
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Form {
                    Section {
                        TextField("해야할 일", text: $todoName)
                        
//                        PriorityColorPicker(selectedColor: $todoColor)
                        
                        TextEditor(text: $todoContent)
                            .lineLimit(3...5)
                            .frame(height: 200)
                        // 텍스트 에디터 안에 "내용"을 넣고 싶어요
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
            title: todoName,
            content: todoContent,
            color: todoColor,
            priority: selectedPriority
            
        )
        print(newTodo)
        
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
        .modelContainer(for: Todo.self)
}

