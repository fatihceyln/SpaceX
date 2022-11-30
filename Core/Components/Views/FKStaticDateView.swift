//
//  FKStaticDateView.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit
import SnapKit

final class FKStaticDateView: UIView {
    
    private struct Constants {
        static let launchDate = "LAUNCH DATE"
    }
    
    private var stackView: FKStackView!
    private var titleLabel: FKTitleLabel!
    private var dateLabeL: FKBodyLabel!

    private let lauch: Launch
    init(launch: Launch) {
        self.lauch = launch
        super.init(frame: .zero)
        
        configureStackView()
        configureTitleLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        stackView = FKStackView(axis: .vertical)
        addSubview(stackView)
        
        stackView.spacing = 0
        stackView.alignment = .leading
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = FKTitleLabel(text: Constants.launchDate, textAlignment: .left, fontSize: .body)
        stackView.addArrangedSubview(titleLabel)
        
        titleLabel.textColor = .theme.primaryWhite
    }
    
    private func configureDateLabel() {
        dateLabeL = FKBodyLabel(text: lauch._launchDate, textAlignment: .left, fontSize: .caption)
        stackView.addArrangedSubview(dateLabeL)
        
        dateLabeL.textColor = .theme.primaryWhite
    }
}
