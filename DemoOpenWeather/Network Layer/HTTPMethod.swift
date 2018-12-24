//
//  HTTPMethod.swift
//  TestDesignPattern
//
//  Created by Manoj Chandola on 25/05/18.
//  Copyright © 2018 Manoj Chandola. All rights reserved.
//

import Foundation

// MARK: HttpMethod
enum HttpMethod<Body> {
    case get
    case post(Body)
}

extension HttpMethod {
    var methodString: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
    func map<B>(f: (Body) -> B) -> HttpMethod<B> where B: Encodable {
        switch self {
        case .get: return .get
        case .post(let body): return .post(f(body))
        }
    }
}
