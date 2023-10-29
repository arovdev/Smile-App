//
//  Settings.swift
//  SmileGen2App
//
//  Created by Arthur Reshetnyak on 2023-10-29.
//

import SwiftUI

struct Settings: View {
    @Binding var customSmiles: String
    @Binding var allSmiles: [[String]]
    
    @Binding var shadowSize: CGFloat

    var body: some View {
        VStack {
            ChangeValues(shadowSize: $shadowSize)
            Divider()
            AddCustomSmile(customSmiles: $customSmiles, allSmiles: $allSmiles)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .frame(width: 300, height: 250)
    }
}

struct ChangeValues: View {
    @Binding var shadowSize: CGFloat
    var body: some View {
        Text("Shadow Size")
        Slider(value: $shadowSize, in: 10...80)
    }
}
struct AddCustomSmile: View {
    @Binding var customSmiles: String
    @Binding var allSmiles: [[String]]
    
    var body: some View {
        VStack {
            TextField("Type a one smile or one letter", text: $customSmiles)
                .padding(.vertical, 4)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity)
                .background(Capsule().fill(.black))
                .textFieldStyle(.plain)
                .onChange(of: customSmiles) { newValue in
                    if newValue.count > 1 {
                        customSmiles = String(newValue.prefix(1))
                    }
                }
            
            Button {
                allSmiles[10].append(customSmiles)
            } label: {
                HStack {
                    Image(systemName: "plus.app.fill")
                        .imageScale(.large)
                    Text("Add")
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Capsule().fill(.blue))
            }
            .buttonStyle(.plain)
        }
    }

}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
