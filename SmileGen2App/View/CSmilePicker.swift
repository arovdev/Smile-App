//
//  CSmilePicker.swift
//  SmileGen2App
//
//  Created by Arthur Reshetnyak on 2023-10-29.
//

import SwiftUI

struct CSmilePicker: View {
    @Binding var selectedSmile: String
    var smiles: [String]
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(smiles, id: \.self) { smile in
                        Text(smile)
                            .font(smile == selectedSmile ? .system(size: 35) : .system(size: 30))
                            .opacity(smile == selectedSmile ? 1 : 0.5)
                            .frame(minWidth: 50, minHeight: 50, alignment: .center)
                            .onTapGesture {
                                selectedSmile = smile
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

struct CSmilePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
