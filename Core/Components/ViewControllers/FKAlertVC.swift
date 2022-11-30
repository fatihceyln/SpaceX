//
//  FKAlertVC.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit
import SnapKit

final class FKAlertVC: UIViewController {
    
    private var containerView: FKAlertContainerView!
    private var titleLabel: FKTitleLabel!
    private var bodyLabel: FKBodyLabel!
    private var actionButton: FKButton!
    
    private let alertTitle: String
    private let alertBody: String
    private let alertButtonTitle: String
    
    init(alertTitle: String, alertBody: String, alertButtonTitle: String) {
        
        self.alertTitle = alertTitle
        self.alertBody = alertBody
        self.alertButtonTitle = alertButtonTitle
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
        configureContainerView()
        configureTitleLabel()
        configureBodyLabel()
        configureActionButton()
    }
    
    private func configureVC() {
        view.backgroundColor = .black.withAlphaComponent(0.7)
    }
    
    private func configureContainerView() {
        containerView = FKAlertContainerView(frame: .zero)
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = FKTitleLabel(text: alertTitle, textAlignment: .center, fontSize: .largeTitle)
        containerView.addArrangedSubview(titleLabel)
    }
    
    private func configureBodyLabel() {
        bodyLabel = FKBodyLabel(text: alertBody, textAlignment: .center, fontSize: .title1)
        containerView.addArrangedSubview(bodyLabel)
        
        bodyLabel.numberOfLines = 15
    }
    
    private func configureActionButton() {
        actionButton = FKButton(title: alertButtonTitle, backgroundColor: .systemRed)
        containerView.addArrangedSubview(actionButton)
        
        actionButton.snp.makeConstraints { make in
            make.height.equalTo(containerView.snp.width).multipliedBy(0.14)
        }
        
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
}

extension FKAlertVC {
    @objc private func actionButtonTapped() {
        dismiss(animated: true)
    }
}
