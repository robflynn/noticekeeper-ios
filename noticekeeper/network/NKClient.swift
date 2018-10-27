//
//  NKClient.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//
import Foundation

/**
  NoticeKeeper API Cilent
 */
class NKClient {
    typealias CompletionHandler = (RequestResponse) -> Void
    typealias RequestParameters = [String : Any]

    public enum NKError: Error {
        case unknown(String)
    }

    public enum RequestResponse {
        case success(Data)
        case failure(Error)
    }

    /// Available Server Environments
    public enum Environment: String {
        case local
    }

    public enum RequestMethod: String {
        case get = "GET"
    }

    public enum ResponseStatus {
        case success
        case failure(Error)
    }

    /// Host URIs
    var APIHostAddress: String {
        switch self.environment {
        case .local: return "http://localhost:5000"
        }
    }

    /// Current API Implementation
    let APIVersion = 0

    /// Base API URL
    var APIBaseURL: String {
        return APIHostAddress + "/api/v\(APIVersion)/"
    }

    /// Server environment
    let environment: Environment

    init(_ environment: Environment) {
        self.environment = environment
    }

    // MARK: - API Calls
    func clients(completion: @escaping ([Client]) -> Void) {
        get(from: "clients") { response in
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                guard let clients = try? decoder.decode([Client].self, from: data) else { return }

                completion(clients)

            case .failure(let error):
                print(error)
                assertionFailure("Implement error handler here")
            }
        }
    }

    // MARK: - Network Helper Methods
    func get(from path: String, completion: CompletionHandler?) {
        fetch(path: path, method: .get, parameters: [:], completion: completion)
    }

    /**
     Fetch the given URL

     - parameter path: The path to fetch
     - parameter method: The HTTP Method
     - parameter parameters: The request parameters
     - parameter completion: Request completion handler

     */
    func fetch(path: String, method: RequestMethod, parameters: RequestParameters, completion: CompletionHandler?) {
        guard let url = URL(string: "\(APIBaseURL)\(path)") else { return }

        // Build request
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }

            if let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
                // success
                completion?(.success(data))
            } else {
                // some kind of server error occurred
                completion?(.failure(NKError.unknown("Some kind of error has occurred.")))
            }
        }

        task.resume()
    }
}
