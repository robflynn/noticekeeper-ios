//
//  Document.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/29/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//
public struct Document: Decodable {
  var id: Int
  var md5_hash: String?
  var date: Int
  var thumbnailUrlString: String
  var pages: Int
  var urlString: String

  enum CodingKeys: String, CodingKey {
    case id
    case md5_hash
    case date
    case thumbnailUrlString = "thumbnail_url"
    case pages
    case urlString = "url"
  }
}
