//
//  FKUpcomingDateVC.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit
import SnapKit

final class FKUpcomingDateVC: UIViewController {
    
    private var timer: Timer!
    
    private var staticDateView: FKStaticDateView!
    
    private var componentsStackView: FKStackView!
    private var hourComponent = FKDateComponentView(component: "Hour", showColon: true)
    private var minuteComponent = FKDateComponentView(component: "Minute", showColon: true)
    private var secondComponent = FKDateComponentView(component: "Second")
    
    lazy private var unix = launch._dateUnix
    
    private let launch: Launch
    
    init(launch: Launch) {
        self.launch = launch
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
        
        configureTimer()
        
        configureStaticDateView()
        configureComponentsStackView()
        configureComponents()
    }
    
    private func configureTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            
            self.unix -= 1
            
            let hour = self.unix.unixToDate().getComponentValue(.hour)
            let minute = self.unix.unixToDate().getComponentValue(.minute)
            let second = self.unix.unixToDate().getComponentValue(.second)
            
            self.hourComponent.setup(value: hour)
            self.minuteComponent.setup(value: minute)
            self.secondComponent.setup(value: second)
        })
    }
}

extension FKUpcomingDateVC {
    
    private func configureVC() {
        view.backgroundColor = .theme.primaryBlack
        view.layer.cornerRadius = 12
    }
    
    private func configureStaticDateView() {
        staticDateView = FKStaticDateView(launch: launch)
        view.addSubview(staticDateView)
        
        staticDateView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configureComponentsStackView() {
        componentsStackView = FKStackView(axis: .horizontal)
        view.addSubview(componentsStackView)
        
        componentsStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func configureComponents() {
        let components = [hourComponent, minuteComponent, secondComponent]
        
        for component in components {
            componentsStackView.addArrangedSubview(component)
        }
        
        hourComponent.setup(value: unix.unixToDate().getComponentValue(.hour))
        minuteComponent.setup(value: unix.unixToDate().getComponentValue(.minute))
        secondComponent.setup(value: unix.unixToDate().getComponentValue(.second))
    }
}
