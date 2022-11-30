//
//  FKLinkItemView.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit
import SnapKit

final class FKLinkItemView: UIView {
    
    private var imageView: FKImageView!
    private var titleLabel: FKTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureImageView()
        configureTitleLabel()
        
        showDisclosureIndicator(size: .indicatorSize, tintColor: .theme.secondary)
    }
    
    convenience init(systemName: String, title: String) {
        self.init(frame: .zero)
        
        imageView.image = UIImage(systemName: systemName)
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = .cornerRadius
        layer.borderColor = UIColor.theme.border?.cgColor
        layer.borderWidth = .borderWidth
    }
    
    private func configureImageView() {
        imageView = FKImageView(frame: .zero)
        addSubview(imageView)
        
        imageView.backgroundColor = .clear
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(2 * .padding)
            make.height.width.equalTo(CGFloat.imageSize)
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = FKTitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.leading.equalTo(imageView.snp.trailing).offset(2 * .padding)
        }
    }
}
