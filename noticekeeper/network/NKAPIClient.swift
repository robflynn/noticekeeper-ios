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
            case .failure(let error):
                assertionFailure("Handle failed case")
            }
        }
    }
}
