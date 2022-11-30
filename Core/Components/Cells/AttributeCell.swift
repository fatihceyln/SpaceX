//
//  AttributeCell.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import UIKit
import SnapKit

final class AttributeCell: UICollectionViewCell {
    static let reuseID = "AttributeCell"
    
    private var stackView: FKStackView!
    private var attributeLabel: FKBodyLabel!
    private var valueLabel: FKTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureStackView()
        configureAttributeLabel()
        configureValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(attribute: String, value: String) {
        attributeLabel.text = attribute
        valueLabel.text = value
    }
    
    private func configure() {
        layer.cornerRadius = .cornerRadius
        
        layer.borderColor = UIColor.theme.border?.cgColor
        layer.borderWidth = .borderWidth
    }
    
    private func configureStackView() {
        stackView = FKStackView(axis: .vertical)
        addSubview(stackView)
        
        stackView.spacing = 0
        stackView.alignment = .leading
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func configureAttributeLabel() {
        attributeLabel = FKBodyLabel(text: "", textAlignment: .left, fontSize: .body)
        stackView.addArrangedSubview(attributeLabel)
    }
    
    private func configureValueLabel() {
        valueLabel = FKTitleLabel(text: "True", textAlignment: .left, fontSize: .title2)
        stackView.addArrangedSubview(valueLabel)
    }
}
