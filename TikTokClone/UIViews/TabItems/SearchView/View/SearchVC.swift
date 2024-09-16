//
//  SearchVC.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import SwiftUI

struct SearchVC: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack{
                    LazyVStack(spacing:16){
                        ForEach (0..<5){ friends in
                            SearchVcCell()
                                .padding(.horizontal)
                        }
                    }
                }
            }.navigationTitle("Expolore")
                .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchVC()
}
