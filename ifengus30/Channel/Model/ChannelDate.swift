//
//  ChannelDate.swift
//  ifengus_v20
//
//  Created by Alan Yang on 1/17/21.
//

import Foundation

// 栏目
struct Channels: Codable, Identifiable {
   public var id: Int
   public var name: String
   public var parent_id: Int
   public var url: String
   
   enum CodingKeys: String, CodingKey {
          case id = "id"
          case name = "name"
          case parent_id = "parent_id"
          case url = "url"
   
       }
}

// 专题
struct Specials: Codable, Identifiable {
   public var id: Int
   public var title: String
   public var image: String
   public var intro: String
   
   enum CodingKeys: String, CodingKey {
          case id = "id"
          case title = "title"
          case image = "image"
          case intro = "intro"
   
       }
}

//获取Config文件中的常量
func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
 }
