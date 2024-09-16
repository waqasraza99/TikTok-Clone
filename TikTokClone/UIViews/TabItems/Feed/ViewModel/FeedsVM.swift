//
//  FeedsVM.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import Foundation


class FeedsVM: ObservableObject {
    
    @Published var isLoading = false
    @Published var isError = false
    
    @Published var errorMessage = ""
    
    @Published var videosList:[Videos] = []
    
    
    func getFeedVideos(){
        
        isLoading = true
        
        ApiManagement.shared.getPopularVideos { [self] response in
            
            isLoading = false
            
            switch response {
            case .success(let success):
                
                videosList = success.videos ?? []
                
                
            case .failure(let failure):
                errorMessage = failure.localizedDescription
                isError = true
            }
            
        }
        
        
    }
    
    
}
