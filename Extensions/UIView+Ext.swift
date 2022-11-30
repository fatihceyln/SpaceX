//
//  UIView+Ext.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func showDisclosureIndicator(size: CGFloat, tintColor: UIColor?) {
        let disclosureIndicator = UIImageView(image: UIImage(systemName: "chevron.right"))
        
        addSubview(disclosureIndicator)

        disclosureIndicator.translatesAutoresizingMaskIntoConstraints = false
        disclosureIndicator.contentMode = .scaleAspectFit
        disclosureIndicator.tintColor = tintColor
        
        disclosureIndicator.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-2 * CGFloat.padding)
            make.width.height.equalTo(size)
        }
    }
}
