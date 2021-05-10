//
//  AirportAPI.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import RxSwift

protocol AirportAPI {
    func fetchAirports() -> Single<AirportsResponse>
}
