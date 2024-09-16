//
//  ProfileVC.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import SwiftUI

struct ProfileVC: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:2){
                    ProfileHeaderVierw()
                    
                    PostGridView()
                }
            }
        }
    }
}

#Preview {
    ProfileVC()
}
