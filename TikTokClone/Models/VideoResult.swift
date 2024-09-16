//
//  VideoResult.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import Foundation


struct VideoResult: Codable {

  var page         : Int?      = nil
  var perPage      : Int?      = nil
  var totalResults : Int?      = nil
  var url          : String?   = nil
  var videos       : [Videos]? = []

  enum CodingKeys: String, CodingKey {

    case page         = "page"
    case perPage      = "per_page"
    case totalResults = "total_results"
    case url          = "url"
    case videos       = "videos"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    page         = try values.decodeIfPresent(Int.self      , forKey: .page         )
    perPage      = try values.decodeIfPresent(Int.self      , forKey: .perPage      )
    totalResults = try values.decodeIfPresent(Int.self      , forKey: .totalResults )
    url          = try values.decodeIfPresent(String.self   , forKey: .url          )
    videos       = try values.decodeIfPresent([Videos].self , forKey: .videos       )
 
  }

  init() {

  }

}
