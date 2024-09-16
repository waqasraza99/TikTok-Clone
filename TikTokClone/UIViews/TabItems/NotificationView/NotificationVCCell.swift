//
//  NotificationVCCell.swift
//  TikTokClone
//
//  Created by Waqas Raza on 09/02/2024.
//

import SwiftUI

struct NotificationVCCell: View {
    var body: some View {
        ZStack{
            HStack(spacing:12){
              
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(Color(.systemGray))
                
                VStack(alignment:.leading){
                    Text("here is the notifcation")
                    Text("post here")
                }
                Spacer()
                
                Rectangle()
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .frame(width: 55, height: 55)
                    .foregroundStyle(Color(.systemGray))
                
            }.padding(.horizontal)
        }
    }
}

#Preview {
    NotificationVCCell()
}
