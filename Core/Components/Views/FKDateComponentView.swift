//
//  FKDateComponentView.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit
import SnapKit

final class FKDateComponentView: UIView {
    
    private var containerStackView: FKStackView!
    private var componentStackView: FKStackView!
    private var valueLabel: FKTitleLabel!
    private var componentLabel: FKBodyLabel!
    private var colonLabel: FKTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        configureContainerStackView()
        configureComponentStackView()
        configureValueLabel()
        configureComponentLabel()
    }
    
    convenience init(component: String, showColon: Bool = false) {
        self.init(frame: .zero)
        
        componentLabel.text = component
        
        guard showColon else { return}
        configureColonLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(value: String) {
        valueLabel.text = value
    }
}

extension FKDateComponentView {
    private func configureContainerStackView() {
        containerStackView = FKStackView(axis: .horizontal)
        addSubview(containerStackView)
        
        containerStackView.spacing = 8
        containerStackView.alignment = .top
        
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureComponentStackView() {
        componentStackView = FKStackView(axis: .vertical)
        containerStackView.addArrangedSubview(componentStackView)
        
        componentStackView.spacing = 0
        componentStackView.alignment = .leading
    }
    
    private func configureValueLabel() {
        valueLabel = FKTitleLabel(text: "", textAlignment: .left, fontSize: .title1)
        componentStackView.addArrangedSubview(valueLabel)
        
        valueLabel.textColor = .theme.primaryWhite
    }

    private func configureComponentLabel() {
        componentLabel = FKBodyLabel(text: "", textAlignment: .left, fontSize: .caption)
        componentStackView.addArrangedSubview(componentLabel)
        
        componentLabel.textColor = .theme.primaryWhite
    }
    
    private func configureColonLabel() {
        colonLabel = FKTitleLabel(text: ":", textAlignment: .left, fontSize: .title1)
        containerStackView.addArrangedSubview(colonLabel)
        
        colonLabel.textColor = .theme.primaryWhite
    }
}
