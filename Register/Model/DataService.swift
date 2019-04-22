//
//  DataService.swift
//  Register
//
//  Created by duycuong on 4/22/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

typealias JSON = Dictionary<AnyHashable, Any>


class DataService {
    static var shared = DataService()
    var _dataCities: [City]?
    var dataCities: [City] {
        get {
            if _dataCities == nil {
                getDataCity(fileName: "Cities")
            }
            return _dataCities ?? []
        }
        set {
            _dataCities = newValue
        }
    }
    
    
    //Get data city
    func getDataCity(fileName: String) -> [City] {
        _dataCities = []
        guard let pathCity = Bundle.main.path(forResource: fileName, ofType: "plist") else { return [] }
        
        guard let dictCity = NSDictionary.init(contentsOfFile: pathCity) else {
            return []
        }
        guard let citiesJon = dictCity["Cities"] as? [JSON] else { return [] }
        
        for cityDictionary in citiesJon {
            if let city = City(dictionary: cityDictionary) {
                print(city.name, city.cityCode)
                _dataCities?.append(city)
            }
        }
        
        return _dataCities ?? []
    }
    
    private var _dataDistrits: [District]?
    var dataDistrict: [District] {
        get {
            if _dataDistrits == nil {
                getDataCity(fileName: "Districts")
            }
            return _dataDistrits ?? []
            
        }
        set {
            _dataDistrits = newValue
        }
    }
    
    
    // Get data District
    func getDataDistrict(fileName: String) -> [District] {
        _dataDistrits = []
        guard let pathDistrict = Bundle.main.path(forResource: fileName, ofType: "plist") else { return [] }
        guard let dictDistrict = NSDictionary.init(contentsOfFile: pathDistrict) as? JSON else { return [] }
        guard let districtJson = dictDistrict["Districts"] as? [JSON] else { return [] }
        
        for districtDictionary in districtJson {
            if let district = District(dictionary: districtDictionary) {
                print(district.name, district.cityCode, district.districtCode)
                _dataDistrits?.append(district)
            }
        }
        return _dataDistrits ?? []
    }
}
