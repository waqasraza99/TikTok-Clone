//
//  ProfileHeaderVierw.swift
//  TikTokClone
//
//  Created by Waqas Raza on 09/02/2024.
//

import SwiftUI

struct ProfileHeaderVierw: View {
    
    
    var body: some View{
        VStack(spacing: 16){
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(Color(.systemGray))
            
            Text("waqas raza")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            HStack(spacing: 16){
                UserStatView(value: 34, title: "following")
                UserStatView(value: 50, title: "followers")
                UserStatView(value: 340, title: "likes")
            }
            
            Button(action: {
                
            }, label: {
                Text("Edit")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width:350 , height: 35)
                    .foregroundColor(.black)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderVierw()
}
