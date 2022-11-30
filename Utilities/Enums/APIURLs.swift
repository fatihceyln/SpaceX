//
//  APIURLs.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import Foundation

enum APIURLs {
    private static let baseURL = "https://api.spacexdata.com/v4"
    
    static let upcomnigLaunches = "\(baseURL)/launches/upcoming"
    static let pastLaunches = "\(baseURL)/launches/past"
    
    static func launchDetail(id: String) -> String {
        "\(baseURL)/launches/\(id)"
    }
}
