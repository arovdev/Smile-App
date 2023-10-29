//
//  Home.swift
//  SmileGen2App
//
//  Created by Arthur Reshetnyak on 2023-10-29.
//

import SwiftUI

struct Home: View {
    // Selected Smile...
    @State var selectedSmile: String = "😄"
    @State private var customSmiles = ""
    
    // MARK: Array All Smiles
    @State private var allSmiles: [[String]] = [
        ["😄", "😆", "😂", "🤣", "😹", "😊", "😃", "😁", "😀", "😅"], // Funny Smiles Index : 0
        ["😢", "😔", "😞", "😭", "😟", "😩", "😓", "😥", "😪", "😢"], // Sad Smiles Index : 1
        ["😍", "🥰", "😘", "💖", "🌹", "💋", "😻", "💘", "💗", "💞"], // Lovely Smiles Index : 2
        ["🎉", "🥳", "🎊", "🎈", "🍾", "🎆", "🎇", "🎁", "🎂", "🎄"], // Party Smiles Index : 3
        ["😡", "🤬", "😤", "👿", "💢", "😠", "🤯", "😾", "👺", "👹"], // Angry Smiles Index : 4
        ["😱", "😮", "😯", "🤯", "😲", "😳", "😵", "😨", "😬", "😦"], // Surprised Smiles Index : 5
        ["😎", "🕶️", "👍", "🆒", "👌", "🤙", "🤘", "👊", "✌️", "👏"], // Cool Smiles Index : 6
        ["❤️", "💕", "💘", "💞", "💓", "💗", "💖", "💝", "💟", "💜"], // Love Smiles Index : 7
        ["🐻", "🐼", "🐶", "🐱", "🐰", "🐨", "🐯", "🐵", "🐷", "🐸"], // Cute Smiles Index : 8
        ["😕", "🤔", "🧐", "😬", "🤷‍♂️", "🤨", "🤷‍♀️", "🤷‍♂️", "🤷‍♀️", "🤷"], // Confused Smiles Index : 9
        [], // Custom for user Index : 10
    ]
    
    @State var selectedColor: Color = .red
    // Array of color for shadow color...
    @State var colors: [Color] = [.red, .yellow, .orange, .purple, .blue, .indigo, .green, .mint, .black, .white]
    
    @State private var isPopoverSettingsVisible = false // Popover...
    @State private var isAnimated = false // Animations...
    
    @State var shadowSize: CGFloat = 40
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Button {
                    isPopoverSettingsVisible.toggle()
                } label: {
                    Image(systemName: "gear")
                        .imageScale(.medium)
                        .frame(width: 30, height: 30)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
                // MARK: Popover
                .popover(isPresented: $isPopoverSettingsVisible, arrowEdge: .bottom) {
                    Settings(customSmiles: $customSmiles, allSmiles: $allSmiles, shadowSize: $shadowSize)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            VStack(alignment: .center) {
                // MARK: Smile
                Text("\(selectedSmile)")
                    .scaleEffect(isAnimated ? 4 : 6)
                    .animation(.easeInOut(duration: 1.0).repeatForever(), value: isAnimated)
                    .shadow(color: selectedColor, radius: shadowSize, x: 0, y: 0)
                    .onAppear {
                        isAnimated = true
                    }
            }
            .frame(maxWidth: .infinity, minHeight: 200)
            
            // MARK: Color Picker
            CColorPicker(selectedColor: $selectedColor, colors: $colors)
                .frame(height: 85)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(allSmiles.indices, id: \.self) { index in
                    VStack {
                        CSmilePicker(selectedSmile: $selectedSmile, smiles: allSmiles[index])
                            .frame(height: 85)
                    }
                    .padding(.vertical, 2)
                }
            }
        }
        .padding(.horizontal, 15)
        .frame(minWidth: 650, maxWidth: 700, minHeight: 500, maxHeight: 600)
        .background(Material.ultraThinMaterial)
        .ignoresSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
