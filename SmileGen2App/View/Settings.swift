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
            Settings()
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .frame(width: 300, height: 180)
    }
    
    @ViewBuilder
    func Settings() -> some View {
        VStack {
            Text("Shadow Size")
                .font(.callout)
                .fontWeight(.medium)
            
            Slider(value: $shadowSize, in: 10...80)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
