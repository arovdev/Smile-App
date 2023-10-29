//
//  CColorPicker.swift
//  SmileGen2App
//
//  Created by Arthur Reshetnyak on 2023-10-29.
//

import SwiftUI

struct CColorPicker: View {
    @Binding var selectedColor: Color
    @Binding var colors: [Color]
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .foregroundColor(color)
                                .frame(width: 45, height: 45)
                                .opacity(color == selectedColor ? 1 : 0.5)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        selectedColor = color
                                    }
                                }
                        }
                    }
                }
                .padding()
                .frame(width: geometry.size.width)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
        }
    }
}

struct CColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
