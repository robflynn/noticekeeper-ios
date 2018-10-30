//
//  Client.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

public struct CourtCase: Decodable {
  var id: Int
  var userID: Int
  var caseName: String
  var caseNumber: String
  var locality: String
  var status: String
  var documents: [Document]?

  enum CodingKeys: String, CodingKey {
    case id
    case userID = "user_id"
    case caseName = "case_name"
    case caseNumber = "case_number"
    case locality = "case_state"
    case status
    case documents
  }
}
