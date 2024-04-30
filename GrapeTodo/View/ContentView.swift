//
//  ContentView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext)
    private var context
    
    @Query(sort: \Todo.createdAt, animation: .smooth)
    private var todos: [Todo]
    
    @State
    var showingAddTodo = false
    
    var body: some View {
        NavigationStack {
            GeometryReader{ geo in
                VStack{
                    Image(systemName: "trash").backgroundStyle(Color.red)
                        .frame(height: geo.size.height * (1/3))
                    ListView
                        .navigationTitle("Todo")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                ActionBar
                            }
                        }
                        .sheet(isPresented: $showingAddTodo) {
                            AddTodoView()
                        }
                        .overlay {
                            if todos.isEmpty {
                                EmptyView.background(Color.red)
                            }
                        }
                        .frame(height: geo.size.height * (2/3))
                }
                
            }.tint(.orange)
        }
    }
    
    @ViewBuilder
    private var ListView: some View {
        List {
            ForEach(todos) { todo in
                TodoView(todo: todo)
            }
            .onDelete(perform: delete)
        }
    }
    
    @ViewBuilder
    private var ActionBar: some View {
        HStack {
            Spacer()
            Button {
                showingAddTodo = true
            } label: {
                Label("Add task", systemImage: "plus")
                    .labelStyle(.titleAndIcon)
                    .font(.subheadline)
            }
            .buttonStyle(.bordered)
            .controlSize(.mini)
        }
    }
    
    @ViewBuilder
    private var EmptyView: some View {
        ContentUnavailableView {
            Label("아직 할일이 없으시네요", systemImage: "text.badge.plus")
        } description: {
            Text("새 할일을 추가 하시면 할일들 보여질 거에요 ")
        }
    }
    
    // MARK: Data operations
    private func delete(indices: IndexSet) {
        for index in indices {
            let todo = todos[index]
            context.delete(todo)
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: user typed keyword
//    @State var searchKeyword: String = ""
//    @State private var isPresented = false
//
//    var results: [Todo] {
//        return searchKeyword.isEmpty ? todos : todos.filter({ todo in
//            todo.title.lowercased().contains(searchKeyword.lowercased())
//        })
//    }
//    var body: some View {
//        GeometryReader{ geo in
//
//            NavigationStack {
//                VStack{
//                    Image(systemName: "trash").backgroundStyle(Color.red)
//                        .frame(height: geo.size.height * (1/3))
//
//                    List {
//                        ForEach(results, id: \.self) { todo in
//                            NavigationLink(destination: TodoDetailView(todo: todo)) {
//                                HStack(alignment: .center) {
////                                    StatusIndicator(status: todo.status)
//                                    StatusIndicator(priority: todo.priority)
//                                    Spacer()
//                                    VStack(alignment: .leading) {
//                                        Text(todo.title)
//                                            .font(.title3)
//                                        Text(formatDate(todo.date))
//                                            .font(.subheadline)
//                                            .foregroundColor(.gray)
//                                    }
//                                }
//                            }
//                        }
//                    }
////                    .listStyle(.inset)
//
//                    // MARK: Add searchable modifier
//                    .searchable(text: $searchKeyword)
//                    .frame(height: geo.size.height * (2/3))
//                }
//                .navigationTitle("포도알 ToDo 만들기")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    Button {
//                        isPresented.toggle()
//                    } label: {
//                        Image(systemName: "plus")
//                            .font(.headline)
//                    }
//                }
//                .sheet(isPresented: $isPresented) {
//                    AddView()
//                }
//
//            }
//        }
//    }
//
//    private func formatDate(_ date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .short
//        return formatter.string(from: date)
//    }
//}

#Preview {
    ContentView().modelContainer(for: Todo.self, inMemory: false)
}
