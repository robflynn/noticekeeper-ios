//
//  NKClient.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

/**
 * NoticeKeeper API Cilent
 */
class NKClient {
    /// Available Server Environments
    public enum Environment: String {
        case local
    }

    /// Host URIs
    var APIHostAddress: String {
        switch self.environment {
        case .local: return "http://localhost:5000"
        }
    }

    /// Server environment
    let environment: Environment

    init(_ environment: Environment) {
        self.environment = environment
    }

    // MARK: - API Calls
    func clients(completion: (() -> Void)?) {
        completion?()
    }

}
