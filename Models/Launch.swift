//
//  Launch.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import Foundation

struct Launch: Codable {
    let links: Links?
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let rocket: String?
    let success: Bool?
    let failures: [Failure]?
    let details: String?
    let flightNumber: Int?
    let name: String?
    let dateUnix: Double?
    let upcoming: Bool?
    let datePrecision: String?
    let cores: [Core]?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case rocket, success, failures, details
        case flightNumber = "flight_number"
        case name
        case dateUnix = "date_unix"
        case upcoming
        case datePrecision = "date_precision"
        case cores, id
    }
}

extension Launch {
    var _name: String {
        name ?? "N/A"
    }
    
    var _dateUnix: Double {
        dateUnix ?? 0
    }
    
    var _launchDate: String {
        _dateUnix.unixToDate().dayMonthYear()
    }
    
    var _landingAttempt: String {
        guard let value = cores?.first?.landingAttempt else {
            return "-"
        }
        
        return String(value).capitalized
    }
    
    var _landingSuccess: String {
        guard let value = cores?.first?.landingSuccess else {
            return "-"
        }
        
        return String(value).capitalized
    }
    
    var _landingType: String {
        guard let value = cores?.first?.landingType else {
            return "-"
        }
        
        return value.capitalized
    }
    
    var _flightNumber: String {
        guard let value = flightNumber else {
            return "-"
        }
        
        return String(value).capitalized
    }
    
    var _upcoming: String {
        guard let value = upcoming else {
            return "-"
        }
        
        return String(value).capitalized
    }
    
    var _datePrecision: String {
        guard let value = datePrecision else {
            return "-"
        }
        
        return value.capitalized
    }
    
    var _attributeNames: [String] {
        ["Landing Attempt", "Landing Succes", "Landing Type", "Flight Number", "Upcoming", "Date Precision"]
    }
    
    var _attributeValues: [String] {
        [
            _landingAttempt,
            _landingSuccess,
            _landingType,
            _flightNumber,
            _upcoming,
            _datePrecision
        ]
    }
}

struct Core: Codable {
    let core: String?
    let landingAttempt, landingSuccess: Bool?
    let landingType, landpad: String?

    enum CodingKeys: String, CodingKey {
        case core
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }
}

struct Failure: Codable {
    let time, altitude: Int?
    let reason: String?
}

struct Links: Codable {
    let patch: Patch?
    let presskit: String?
    let webcast: String?
    let article: String?
    let wikipedia: String?
}

struct Patch: Codable {
    let small: String?
}
