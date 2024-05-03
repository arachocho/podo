//
//  GrapeTodoApp.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI
import SwiftData

@main

struct GrapeTodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .modelContainer(for: Todo.self)
        }
    }
}
