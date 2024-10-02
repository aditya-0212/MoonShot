//
//  GridUIView.swift
//  Moonshot
//
//  Created by APPLE on 15/05/24.
//

import SwiftUI

struct GridUIView: View {
    
    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
        GridItem(.adaptive(minimum:80,maximum: 120))
    ]
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows:layout){
                ForEach(0..<1000){
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    GridUIView()
}
