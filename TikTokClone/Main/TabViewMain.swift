//
//  DashboardVC.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import SwiftUI

struct TabViewMain: View {
    
    @State var selection = 0
    
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selection) {
                
                FeedVC()
                    .tabItem {
                        
                        Image(systemName: "house")
                        
                        Text("Feeds")
                        
                    }.tag(0)
                
                SearchVC()
                    .tabItem {
                    
                    Image(systemName: "magnifyingglass")
                    
                    Text("Search")
                    
                }.tag(1)
                
                NotificationsVC()
                    .tabItem {
                    
                    Image(systemName: "bell")
                    
                    Text("Notification")
                    
                }.tag(2)
                
                ProfileVC()
                    .tabItem {
                    
                    Image(systemName: "person.fill")
                    
                    Text("Profile")
                    
                }.tag(3)
                
            }
            
        }
    }
}

#Preview {
    TabViewMain()
}
