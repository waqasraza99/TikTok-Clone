//
//  SearchVcCell.swift
//  TikTokClone
//
//  Created by Waqas Raza on 09/02/2024.
//

import SwiftUI

struct SearchVcCell: View {
    var body: some View {
        ZStack{
                HStack(spacing:12){
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(Color(.systemGray))
                    
                    VStack(alignment:.leading){
                        Text("post 1")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("post cap[tion shows here")
                            .font(.footnote)
                    }
                    Spacer()
                }
               
          
        }
    }
}

#Preview {
    SearchVcCell()
}
