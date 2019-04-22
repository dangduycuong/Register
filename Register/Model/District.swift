//
//  District.swift
//  Register
//
//  Created by duycuong on 4/22/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import Foundation

class District: NSObject, Place {
    var cityCode: Int
    var districtCode: Int
    var name: String
    
    init?(dictionary: JSON) {
        guard let cityCode = dictionary["CityCode"] as? Int else { return nil }
        guard let districtCode = dictionary["DistrictCode"] as? Int else { return nil }
        guard let name = dictionary["Name"] as? String else { return nil }
        
        self.cityCode = cityCode
        self.districtCode = districtCode
        self.name = name
    }
}
