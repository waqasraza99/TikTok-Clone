//
//  UserStatView.swift
//  TikTokClone
//
//  Created by Waqas Raza on 09/02/2024.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title : String
    
    var body: some View{
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    UserStatView(value: 3, title: "followers")
}
