//
//  CGFloat+Ext.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit

extension CGFloat {
    
    static let largeTitle: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 18 : 22
    static let title1: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 16 : 20
    static let title2: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 12: 16
    static let body: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 11 : 15
    static let caption: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 8 : 12
    
    static let padding: CGFloat = 8
    static let margin: CGFloat = 10
    static let cornerRadius: CGFloat = 12
    static let borderWidth: CGFloat = 2
    
    static let indicatorSize: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 16 : 24
    
    static let itemHeight: CGFloat = ScreenSize.height * 0.08
    static let imageSize: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed || DeviceTypes.isiPhone8Standard ? 32 : 50
    static let upcomingDateHeight: CGFloat = ScreenSize.height * 0.09
    static let attributesViewHeight: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed || DeviceTypes.isiPhone8Standard ? ScreenSize.height * 0.4 : ScreenSize.height * 0.3
    static let attributesViewWidth: CGFloat = ScreenSize.width * 0.9
}
