//
//  ApiManagement.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import Foundation
import Alamofire

class ApiManagement{
    
    static let shared = ApiManagement()
    let baseURL = "https://api.pexels.com/"
    
    let headers: HTTPHeaders = [
        "Authorization": Constants.apiKey,
        "Content-Type": "application/json"
    ]
    
    func getPopularVideos(completion: @escaping (Result<VideoResult, Error>) -> Void) {
        
        let url = baseURL + "videos/popular"
        
        AF.request(url,method: .get,headers: headers)
            .responseDecodable(of: VideoResult.self) { response in
                
                switch response.result {
                    
                case .success(let videos):
                    
                    completion(.success(videos))
                    break
                    
                case .failure(let error):
                    completion(.failure(error))
                    break
                    
                }
                
            }
        
        
    }
    
    
}
