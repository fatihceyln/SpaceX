//
//  FKBodyLabel.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import UIKit

final class FKBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        
        self.text = text
        self.textAlignment = textAlignment
        self.font = .systemFont(ofSize: fontSize)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        numberOfLines = 0
        textColor = .theme.secondary
        
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        
        lineBreakMode = .byTruncatingTail
    }
    
}
