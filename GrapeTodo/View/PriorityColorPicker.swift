//
//  PriorityColorPicker.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI

struct PriorityColorPicker: View {
    @Binding var selectedColor: SelectColor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("색깔 선택 하기 ")
                .font(.callout)
            HStack {
                ForEach(SelectColor.allCases, id: \.self) { taskColor in
                    Button {
                        selectedColor = taskColor
                    } label: {
                        Image(systemName: selectedColor == taskColor ? "circle.circle.fill" : "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(taskColor.representable)
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    PriorityColorPicker(selectedColor: .constant(.red))
}
