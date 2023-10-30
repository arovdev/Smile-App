//
//  Home.swift
//  SmileGen2App
//
//  Created by Arthur Reshetnyak on 2023-10-29.
//

import SwiftUI

struct Home: View {
    @State var selectedSmile: String = "😄"
    @State private var customSmiles: String = ""
    
    @State var selectedColor: Color = .red
    @State var customColor: Color = .red
    
    @State var shadowSize: CGFloat = 40

    // Array of custom smiles...
    @State private var allCustomSmiles: [String] = []
    
    // Array of smiles...
    @State private var allSmiles: [[String]] = [
        ["😄", "😆", "😂", "🤣", "😹", "😊", "😃", "😁", "😀", "😅"], // Funny Smiles Index : 1
        ["😢", "😔", "😞", "😭", "😟", "😩", "😓", "😥", "😪", "😢"], // Sad Smiles Index : 2
        ["😍", "🥰", "😘", "💖", "🌹", "💋", "😻", "💘", "💗", "💞"], // Lovely Smiles Index : 3
        ["🎉", "🥳", "🎊", "🎈", "🍾", "🎆", "🎇", "🎁", "🎂", "🎄"], // Party Smiles Index : 4
        ["😡", "🤬", "😤", "👿", "💢", "😠", "🤯", "😾", "👺", "👹"], // Angry Smiles Index : 5
        ["😱", "😮", "😯", "🤯", "😲", "😳", "😵", "😨", "😬", "😦"], // Surprised Smiles Index : 6
        ["😎", "🕶️", "👍", "🆒", "👌", "🤙", "🤘", "👊", "✌️", "👏"], // Cool Smiles Index : 7
        ["❤️", "💕", "💘", "💞", "💓", "💗", "💖", "💝", "💟", "💜"], // Love Smiles Index : 8
        ["🐻", "🐼", "🐶", "🐱", "🐰", "🐨", "🐯", "🐵", "🐷", "🐸"], // Cute Smiles Index : 9
        ["😕", "🤔", "🧐", "😬", "🤷‍♂️", "🤨", "🤷‍♀️", "🤷‍♂️", "🤷‍♀️", "🤷"], // Confused Smiles Index : 10
    ]
    
    // Array of colors for shadow color...
    @State var colors: [Color] = [.red, .yellow, .orange, .purple, .blue, .indigo, .green, .mint, .black, .white]
    
    // Popovers chek...
    @State private var isPopoverSettingsVisible = false
    @State private var isPopoverColorPickerVisible = false
    @State private var isPopoverCustomSmileVisible = false
    
    @State private var isAnimated = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Header()
            Smile()
            ColorPicker()
            SmilesPicker()
        }
        .padding(.horizontal, 15)
        .frame(minWidth: 650, maxWidth: 700, minHeight: 500, maxHeight: 600)
        .background(Material.ultraThinMaterial)
        .ignoresSafeArea(.all)
    }
    @ViewBuilder
    func Header() -> some View {
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
            .popover(isPresented: $isPopoverSettingsVisible, arrowEdge: .trailing) {
                Settings(customSmiles: $customSmiles, allSmiles: $allSmiles, shadowSize: $shadowSize)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    @ViewBuilder
    func Smile() -> some View {
        VStack(alignment: .center) {
            Text("\(selectedSmile)")
                .scaleEffect(isAnimated ? 4 : 6)
                .animation(.easeInOut(duration: 1.0).repeatForever(), value: isAnimated)
                .shadow(color: selectedColor, radius: shadowSize, x: 0, y: 0)
                .onAppear {
                    isAnimated = true
                }
        }
        .frame(maxWidth: .infinity, minHeight: 200)
    }
    
    @ViewBuilder
    func ColorPicker() -> some View {
        HStack {
            CColorPicker(selectedColor: $selectedColor, colors: $colors)
                .frame(height: 85)
            
            Button {
                isPopoverColorPickerVisible.toggle()
            } label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial))
            }
            .padding()
            .buttonStyle(.plain)
            .popover(isPresented: $isPopoverColorPickerVisible, arrowEdge: .trailing) {
                AddColor(colors: $colors, customColor: $customColor)
            }
        }
    }
    
    @ViewBuilder
    func SmilesPicker() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                CSmilePicker(selectedSmile: $selectedSmile, smiles: allCustomSmiles)
                    .frame(minHeight: 85, maxHeight: 85)
                
                Button {
                    isPopoverCustomSmileVisible.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial))
                }
                .padding()
                .buttonStyle(.plain)
                .popover(isPresented: $isPopoverCustomSmileVisible, arrowEdge: .trailing) {
                    AddSmile(customSmiles: $customSmiles, allCustomSmiles: $allCustomSmiles)
                }
            }
            
            ForEach(allSmiles.indices, id: \.self) { index in
                VStack {
                    CSmilePicker(selectedSmile: $selectedSmile, smiles: allSmiles[index])
                        .frame(height: 85)
                }
                .padding(.vertical, 2)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
