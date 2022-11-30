//
//  FKAlertContainerView.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit

final class FKAlertContainerView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .vertical
        spacing = 2 * .padding
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 2 * CGFloat.margin, left: 2 * CGFloat.margin, bottom: 2 * CGFloat.margin, right: 2 * CGFloat.margin)
        
        backgroundColor = .theme.background
        
        layer.cornerRadius = .cornerRadius
    }
}
