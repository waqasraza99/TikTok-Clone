//
//  VideoPictures.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import Foundation

struct VideoPictures: Codable {

  var id      : Int?    = nil
  var picture : String? = nil
  var nr      : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case id      = "id"
    case picture = "picture"
    case nr      = "nr"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id      = try values.decodeIfPresent(Int.self    , forKey: .id      )
    picture = try values.decodeIfPresent(String.self , forKey: .picture )
    nr      = try values.decodeIfPresent(Int.self    , forKey: .nr      )
 
  }

  init() {

  }

}
