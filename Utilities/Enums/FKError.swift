//
//  FKError.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import Foundation

enum FKError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid respond got back from the server! Please try again"
    case invalidData = "The data recieved from the service was invalid. Plase try again."
    case invalidURL = "The given url was invalid. Please give real URL."
    case unableToParseFromJSON = "An error occurred while decoding from JSON to model."
    
    case title = "Error!"
    case noAvailableContent = "There is no available content!"
}
