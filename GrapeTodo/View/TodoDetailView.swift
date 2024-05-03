import SwiftUI
import SwiftData

struct TodoDetailView: View {
    private var todo: Todo
    
    public init(todo: Todo) {
        self.todo = todo
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(todo.title)
                .font(.title)
                .padding(.bottom, 1)
            
            HStack {
                Text("Description:") // 투두리스트 상세내용
                    .font(.subheadline)
                    .bold()
                Text(todo.content)
                    .font(.subheadline)
            }
            
            
            Text("Priority: \(Priority(rawValue: todo.priority)?.description ?? "N/A")")
                .font(.subheadline)
            
            Text("Color: \(translateColor(todo.color))")
                .font(.subheadline)
                .foregroundColor(Color(translateColor(todo.color)))
            
        }
        .padding()
        Spacer()
        Text("Status: \(todo.completed ? "Completed" : "Pending")") // 완료되면 completed, 진행중이면 pending
            .font(.subheadline)
            .foregroundColor(todo.completed ? .green : .red)
        
        Text(formatDate(todo.createdAt)) //디테일뷰 하단 날짜
            .font(.subheadline)
            .foregroundColor(.gray)
            .navigationTitle("Todo Details")
        
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func translateColor(_ color: String) -> String {
        switch color {
        case "red": return "Red"
        case "blue": return "Blue"
        case "green": return "Green"
        default: return "Gray"
        }
    }
    
}

