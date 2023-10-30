//
//  AddSmile.swift
//  SmileGen2App
//
//  Created by Arthur Reshetnyak on 2023-10-30.
//

import SwiftUI

struct AddSmile: View {
    @Binding var customSmiles: String
    @Binding var allCustomSmiles: [String]
    
    var body: some View {
        VStack {
            AddSmile()
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .frame(width: 300, height: 200)
    }
    
    @ViewBuilder
    func AddSmile() -> some View {
        VStack {
            TextField("Type a smiles or text", text: $customSmiles)
                .padding(.vertical, 4)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity)
                .background(Capsule().fill(.clear))
                .textFieldStyle(.plain)
                .onChange(of: customSmiles) { newValue in
                    if newValue.count > 1 {
                        customSmiles = String(newValue.prefix(5))
                    }
                }
            Divider()
            Text("You can write only 5 symbols")
                .font(.caption)
                .fontWeight(.medium)
            Divider()
            Button {
                if(!allCustomSmiles.contains(customSmiles)) {
                    allCustomSmiles.append(customSmiles)
                } else {}
            } label: {
                HStack {
                    Image(systemName: "plus.app.fill")
                        .imageScale(.large)
                    Text("Add")
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
            }
            .buttonStyle(.plain)
        }
    }
}

struct AddSmile_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
