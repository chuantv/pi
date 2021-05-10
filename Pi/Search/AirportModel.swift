//
//  AirportModel.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import Foundation

struct AirportModel: Codable {
    let code, lat, lon, name: String
    let city, country: String
    
    enum CodingKeys: String, CodingKey {
        case code, lat, lon, name, city, country
    }
}

extension AirportModel: Equatable {
    static func == (lhs: AirportModel, rhs: AirportModel) -> Bool {
        return lhs.code == rhs.code
    }
}

extension AirportModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }
}

typealias  AirportsResponse = [AirportModel]
