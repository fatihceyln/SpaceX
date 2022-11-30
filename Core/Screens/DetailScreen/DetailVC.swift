//
//  DetailVC.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import UIKit
import SnapKit

final class DetailVC: UIViewController {

    private var scrollView: UIScrollView!
    private var stackView: FKStackView!
    private var launchHeaderView: FKLaunchHeaderView!
    private var pastLaunchDateView: FKPastLaunchDateView!
    
    private var attributesView: UIView!
    private var linksView: UIView!
    private var upcomingDateView: UIView!
    
    let launch: Launch
    
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
        configureScrollView()
        configureStackView()
        configureLaunchHeaderView()
        
        if launch.upcoming == true {
            configureUpcomingDateView()
        } else {
            configurePastLaunchDateView()
        }
        
        configureAttributesView()
        configureLinksView()
    }
}

// MARK: UI Configurations
extension DetailVC {
    private func configureVC() {
        view.backgroundColor = .theme.background
        title = (launch.upcoming ?? false) ? "Launches Upcoming" : "Launches Past"
    }
    
    private func configureScrollView() {
        scrollView = UIScrollView(frame: .zero)
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    private func configureStackView() {
        stackView = FKStackView(axis: .vertical)
        scrollView.addSubview(stackView)
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 20, left: 0, bottom: 20, right: 0)
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView).multipliedBy(0.9)
            make.centerX.equalTo(scrollView.snp.centerX)
        }
    }
    
    private func configureLaunchHeaderView() {
        launchHeaderView = FKLaunchHeaderView()
        stackView.addArrangedSubview(launchHeaderView)
        
        launchHeaderView.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width)
            make.height.equalTo(CGFloat.itemHeight)
        }
        
        launchHeaderView.setup(launch: launch)
        
        if launch.upcoming == false {
            stackView.setCustomSpacing(8, after: launchHeaderView)
        }
    }
    
    private func configurePastLaunchDateView() {
        pastLaunchDateView = FKPastLaunchDateView()
        stackView.addArrangedSubview(pastLaunchDateView)
        
        pastLaunchDateView.setup(launch: launch)
        pastLaunchDateView.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width)
        }
    }
    
    private func configureAttributesView() {
        attributesView = UIView()
        stackView.addArrangedSubview(attributesView)
        
        attributesView.translatesAutoresizingMaskIntoConstraints = false
        
        attributesView.snp.makeConstraints { make in
            make.height.equalTo(CGFloat.attributesViewHeight)
            make.width.equalToSuperview()
        }
        
        add(childVC: FKAttributesVC(launch: launch), to: attributesView)
    }
    
    private func configureLinksView() {
        linksView = UIView()
        stackView.addArrangedSubview(linksView)
        
        linksView.translatesAutoresizingMaskIntoConstraints = false
        
        let linksViewHeight = (4 * CGFloat.itemHeight) + (3 * CGFloat.margin)
        
        linksView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(linksViewHeight)
        }
        
        add(childVC: FKLinksVC(launch: launch), to: linksView)
    }
    
    private func configureUpcomingDateView() {
        upcomingDateView = UIView(frame: .zero)
        stackView.addArrangedSubview(upcomingDateView)
        
        upcomingDateView.translatesAutoresizingMaskIntoConstraints = false
        
        upcomingDateView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(CGFloat.upcomingDateHeight)
        }
        
        add(childVC: FKUpcomingDateVC(launch: launch), to: upcomingDateView)
    }
}
