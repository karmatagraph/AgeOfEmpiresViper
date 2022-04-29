//
//  Endpoints.swift
//  AgeOfEmpiresViper
//
//  Created by karma on 4/29/22.
//

import Foundation

struct API {
    static let url = "https://age-of-empires-2-api.herokuapp.com/api/v1/"
    
}

protocol Endpoint {
    var path: String { get }
    var url: URL { get }
}

enum Endpoints {
    case civs
}

extension Endpoints: Endpoint {
    var path: String {
        switch self {
        case .civs:
            return "civilizations"
        }
    }
    
    var url: URL {
        return URL(string: "\(API.url)\(path)")!
    }
}
