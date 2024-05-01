//
//  StatusIndicator.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI


struct StatusIndicator: View {
    var priority: Priority

    var body: some View {
        let backgroundColor: Color = {
                        switch priority {
                        case .routine:
                            return Color.green
                        case .high:
                            return Color.red
                        case .medium:
                            return Color.blue
                        case .low:
                            return Color.gray
                        }
                    }()

        Text("\(priority)")
            .font(.footnote)
            .foregroundColor(.white)
            .padding(8)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}
