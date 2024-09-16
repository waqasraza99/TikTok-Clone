//
//  Videos.swift
//  TikTokClone
//
//  Created by Waqas Raza on 13/12/2023.
//

import Foundation

struct Videos: Codable,Identifiable {

  var id            : Int?             = nil
  var width         : Int?             = nil
  var height        : Int?             = nil
  var url           : String?          = nil
  var image         : String?          = nil
  var duration      : Int?             = nil
  var user          : User?            = User()
  var videoFiles    : [VideoFiles]?    = []
  var videoPictures : [VideoPictures]? = []

  enum CodingKeys: String, CodingKey {

    case id            = "id"
    case width         = "width"
    case height        = "height"
    case url           = "url"
    case image         = "image"
    case duration      = "duration"
    case user          = "user"
    case videoFiles    = "video_files"
    case videoPictures = "video_pictures"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id            = try values.decodeIfPresent(Int.self             , forKey: .id            )
    width         = try values.decodeIfPresent(Int.self             , forKey: .width         )
    height        = try values.decodeIfPresent(Int.self             , forKey: .height        )
    url           = try values.decodeIfPresent(String.self          , forKey: .url           )
    image         = try values.decodeIfPresent(String.self          , forKey: .image         )
    duration      = try values.decodeIfPresent(Int.self             , forKey: .duration      )
    user          = try values.decodeIfPresent(User.self            , forKey: .user          )
    videoFiles    = try values.decodeIfPresent([VideoFiles].self    , forKey: .videoFiles    )
    videoPictures = try values.decodeIfPresent([VideoPictures].self , forKey: .videoPictures )
 
  }

  init() {

  }

}
