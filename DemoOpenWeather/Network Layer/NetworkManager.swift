//
//  NetworkManager.swift
//  TestDesignPattern
//
//  Created by Manoj Chandola on 25/05/18.
//  Copyright © 2018 Manoj Chandola. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Any?,_ response: URLResponse?,_ error: Error?)->()

enum Result<String>{
    case success
    case failure(String)
}

struct Resource {
    let method: HttpMethod<Data>
    let url: URL
}

extension Resource {
    init<T>(method: HttpMethod<T>, url: URL) where T: Encodable {
        self.method = method.map { json in try! JSONEncoder().encode(json) }
        self.url = url
    }
}

extension URLRequest {
    init(resource: Resource) {
        self.init(url: resource.url)
        httpMethod = resource.method.methodString
        if case let .post(data) = resource.method { httpBody = data }
    }
}

final class NetworkManager {
    func load(resource: Resource, completion: @escaping NetworkRouterCompletion) {
        let request = URLRequest(resource: resource)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, response, error)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, response, error)
                        return
                    }
                    completion(responseData, response, error)
                case .failure(_):
                    completion(nil, response, error)
                }
            }
            }.resume()
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
