//
//  User.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import Foundation

struct User: Codable {

  var id   : Int?    = nil
  var name : String? = nil
  var url  : String? = nil

  enum CodingKeys: String, CodingKey {

    case id   = "id"
    case name = "name"
    case url  = "url"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id   = try values.decodeIfPresent(Int.self    , forKey: .id   )
    name = try values.decodeIfPresent(String.self , forKey: .name )
    url  = try values.decodeIfPresent(String.self , forKey: .url  )
 
  }

  init() {

  }

}
