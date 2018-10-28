//
//  APIResponse.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

public enum APIResponse<Value> {
    case success(Value)
    case failure(Error)
}
