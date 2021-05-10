//
//  AirportService.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import RxSwift
import RxCocoa

class AirportService {
    static let shared: AirportService = AirportService()
}

extension AirportService: AirportAPI  {
    func fetchAirports() -> Single<AirportsResponse> {
        return Single.create { (single) -> Disposable in
            
            do {
                
                var listCity: AirportsResponse = []
                
                listCity.append(AirportModel(code: "SGN", lat: "12", lon: "32", name: "Tan Son Nhat", city: "HCM", country: "VietNam"))
                listCity.append(AirportModel(code: "NBA", lat: "12", lon: "32", name: "Noi Bai", city: "HAN", country: "VietNam"))
                listCity.append(AirportModel(code: "VCL", lat: "12", lon: "32", name: "Chu Lai", city: "QuangNam", country: "VietNam"))
                listCity.append(AirportModel(code: "DAD", lat: "12", lon: "32", name: "Da Nang", city: "Da Nag", country: "VietNam"))
                
                listCity.append(AirportModel(code: "VDO", lat: "12", lon: "32", name: "Van Don", city: "Quảng Ninh", country: "VietNam"))
                
                listCity.append(AirportModel(code: "PQC", lat: "12", lon: "32", name: "Phu Quoc", city: "Kiên Giang", country: "VietNam"))
                
                single(.success(listCity))
            }catch {
                
            }
            return Disposables.create()
        }
    }
    
    
}
