//
//  File.swift
//  SimpleNetworkLibrary
//
//  Created by Dawinder on 09/02/24.
//

import Foundation
import Alamofire

public class NetworkManager {
    public static let shared = NetworkManager()

    private init() {}

    public func request<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        AF.request(url).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

public enum NetworkError: Error {
    case invalidURL
    case unknown
}
