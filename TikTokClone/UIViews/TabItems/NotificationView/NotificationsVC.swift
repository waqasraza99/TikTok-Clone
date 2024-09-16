//
//  NotificationsVC.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import SwiftUI

struct NotificationsVC: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack{
                    LazyVStack(spacing:16){
                        ForEach (0..<5){ friends in
                            NotificationVCCell()
                                .padding(.horizontal)
                        }
                    }
                }
            }.navigationTitle("Notifications")
                .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsVC()
}
