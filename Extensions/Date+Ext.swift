//
//  Date+Ext.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import Foundation

extension Date {
    
    func dayMonthYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    func getComponentValue(_ component: Calendar.Component) -> String {
        String(Calendar.current.component(component, from: self))
    }
}
