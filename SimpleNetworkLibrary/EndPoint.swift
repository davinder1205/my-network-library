//
//  File.swift
//  SimpleNetworkLibrary
//
//  Created by Dawinder on 09/02/24.
//

import Foundation

public protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    public var url: URL? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        components?.queryItems = queryItems
        return components?.url
    }
}
