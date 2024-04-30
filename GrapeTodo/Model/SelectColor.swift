//
//  SelectColor.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI

enum SelectColor: String, CaseIterable {
    case red, orange, yellow, green, blue, purple
    
    var representable: Color {
        switch self {
        case .red: .red
        case .orange: .orange
        case .yellow: .yellow
        case .green: .green
        case .blue: .blue
        case .purple: .purple
        }
    }
}
