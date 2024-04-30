//
//  TodoDetailView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI
import SwiftData

struct TodoDetailView: View {
    private var todo: Todo
    
    public init(todo: Todo) {
        self.todo = todo
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(todo.content)
                .font(.subheadline)
            Text(formatDate(todo.createdAt))
                .font(.subheadline)
                .foregroundColor(.gray)
            //                StatusIndicator(status: todo.status)
            //                StatusIndicator(priority: todo.priority)
        }
        .padding()
        .navigationTitle("Todo Details")
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

}
