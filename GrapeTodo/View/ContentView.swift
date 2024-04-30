//
//  ContentView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: user typed keyword
    @State var searchKeyword: String = ""
    @State private var isPresented = false
    
    var results: [Todo] {
        return searchKeyword.isEmpty ? todos : todos.filter({ todo in
            todo.title.lowercased().contains(searchKeyword.lowercased())
        })
    }
    var body: some View {
        GeometryReader{ geo in
            
            NavigationStack {
                VStack{
                    Image(systemName: "trash").backgroundStyle(Color.red)
                        .frame(height: geo.size.height * (1/3))
                    
                    List {
                        ForEach(results, id: \.self) { todo in
                            NavigationLink(destination: TodoDetailView(todo: todo)) {
                                HStack(alignment: .center) {
//                                    StatusIndicator(status: todo.status)
                                    StatusIndicator(priority: todo.priority)
                                    Spacer()
                                    VStack(alignment: .leading) {
                                        Text(todo.title)
                                            .font(.title3)
                                        Text(formatDate(todo.date))
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }  
                                }
                            }
                        }
                    }
//                    .listStyle(.inset)
                   
                    // MARK: Add searchable modifier
                    .searchable(text: $searchKeyword)
                    .frame(height: geo.size.height * (2/3))
                }
                .navigationTitle("포도알 ToDo 만들기")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.headline)
                    }
                }
                .sheet(isPresented: $isPresented) {
                    AddView()
                }
            
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    ContentView()
}
