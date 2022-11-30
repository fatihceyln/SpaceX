//
//  Double+Ext.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import Foundation

extension Double {
    
    func unixToDate() -> Date {
        Date(timeIntervalSince1970: self)
    }
}
