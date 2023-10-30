//
//  AddColor.swift
//  SmileGen2App
//
//  Created by Arthur Reshetnyak on 2023-10-29.
//

import SwiftUI

struct AddColor: View {
    @Binding var colors: [Color]
    @Binding var customColor: Color
    
    var body: some View {
        VStack {
            AddColor()
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .frame(width: 300, height: 150)
    }
    
    @ViewBuilder
    func AddColor() -> some View {
        VStack {
            HStack(spacing: 5) {
                Text("Select color :")
                ColorPicker("", selection: $customColor)
            }
            Divider()
            Text("Color description : \(customColor.description)")
                .font(.caption)
                .fontWeight(.medium)
            Divider()
            Button {
                if(!colors.contains(customColor)) {
                    colors.append(customColor)
                } else {}
            } label: {
                HStack {
                    Image(systemName: "plus.app.fill")
                        .imageScale(.large)
                    Text("Add color")
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
            }
            .buttonStyle(.plain)
        }
    }
}

struct AddColor_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
