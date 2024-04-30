//
//  TodoDetailView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI

struct TodoDetailView: View {
    var todo: Todo

        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Text(todo.title)
                    .font(.title)
                Text(formatDate(todo.date))
                    .font(.subheadline)
                    .foregroundColor(.gray)
//                StatusIndicator(status: todo.status)
                StatusIndicator(priority: todo.priority)
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
