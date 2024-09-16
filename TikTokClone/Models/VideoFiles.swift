//
//  VideoFiles.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import Foundation

struct VideoFiles: Codable {

  var id       : Int?    = nil
  var quality  : String? = nil
  var fileType : String? = nil
  var width    : Int?    = nil
  var height   : Int?    = nil
  var link     : String? = nil

  enum CodingKeys: String, CodingKey {

    case id       = "id"
    case quality  = "quality"
    case fileType = "file_type"
    case width    = "width"
    case height   = "height"
    case link     = "link"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id       = try values.decodeIfPresent(Int.self    , forKey: .id       )
    quality  = try values.decodeIfPresent(String.self , forKey: .quality  )
    fileType = try values.decodeIfPresent(String.self , forKey: .fileType )
    width    = try values.decodeIfPresent(Int.self    , forKey: .width    )
    height   = try values.decodeIfPresent(Int.self    , forKey: .height   )
    link     = try values.decodeIfPresent(String.self , forKey: .link     )
 
  }

  init() {

  }

}
