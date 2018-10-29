//
//  NKClient.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

/**
  NoticeKeeper API Cilent
 */
class NKAPIClient: JSONAPIClient {
    var baseURLString: String {
        switch self.environment {
        case .local: return "http://localhost:5000/api/v0"
        }
    }

    var environment: Environment = .local

    func cases(completion: @escaping ([CourtCase]) -> Void) {
        get(as: [CourtCase].self, from: "/clients") { response in
            switch response {
            case .success(let cases):
                completion(cases)
            case .failure( _):
                assertionFailure("Handle failed case")
            }
        }
    }

  func `case`(_ id: Int, completion: @escaping (CourtCase) -> Void) {
    get(as: CourtCase.self, from: "/clients/\(id)") { response in
      switch response {
      case .success(let `case`):
          completion(`case`)
      case .failure( _):
          assertionFailure("Handle failed case")
      }
    }
  }
}
