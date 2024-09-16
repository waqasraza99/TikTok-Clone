//
//  PostGridView.swift
//  TikTokClone
//
//  Created by Waqas Raza on 09/02/2024.
//

import SwiftUI

struct PostGridView: View {
    
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
    ]
    
    private let width = (UIScreen.main.bounds.width / 3) - 2
    
    var body: some View {
        LazyVGrid(columns: items){
            
            ForEach(0..<10){ items in
                Rectangle()
                    .frame(width: width, height: 140)
                    .clipped()
                
            }
        }
    }
}

#Preview {
    PostGridView()
}
