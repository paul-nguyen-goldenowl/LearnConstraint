//
//  NetworkManager.swift
//  LearnConstraint
//
//  Created by Golden Owl on 06/10/2022.
//

import Alamofire
import Foundation

typealias CompletionClosure = (Result<[Post], NetworkError>) -> Void

class NetworkManager {
    static let shared = NetworkManager()

    func fetchPosts(completion: @escaping CompletionClosure) {
        let url = "https://jsonplaceholder.typicode.com/posts"

        AF.sessionConfiguration.timeoutIntervalForRequest = 50
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.default)
            .validate(statusCode: 200 ..< 299)
            .validate(contentType: ["application/json"])
            .responseData { responseData in
                guard let response = responseData.response
                else { return completion(.failure(.serverError)) }
                if response.statusCode >= 300 {
                    completion(.failure(.badURL))
                }
            }
            .responseDecodable(of: [Post].self) { response in
                guard let posts = response.value
                else { return completion(.failure(.badJSON)) }
                completion(.success(posts))
            }
    }
}
