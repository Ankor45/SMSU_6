//
//  ContentView.swift
//  SMSU_6
//
//  Created by Andrei Kovryzhenko on 14.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isDiagonal = false
    
    let squeresCount = 7
    
    var body: some View {
        let layout = isDiagonal ? AnyLayout(DStackLayout()) : AnyLayout(HStackLayout())
        layout {
            ForEach(0..<squeresCount, id: \.self){ _ in
                Rectangle()
                    .fill(.blue)
                    .cornerRadius(12)
                    .scaledToFit()
            }
        }
        .onTapGesture {
            withAnimation() {
                isDiagonal.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
