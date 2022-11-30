//
//  FKLinksVC.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit
import SnapKit

final class FKLinksVC: UIViewController {
    
    // !!!
    // I COULD HAVE USED STACKVIEW BUT I'M GETTING CONSTRAINT ERRORS WHEN SPACING IS NOT SET TO 0, SO THIS IS WHY I'M NOT USING STACK VIEW.
    // !!!
    
    private let youtubeItemView = FKLinkItemView(systemName: SFSymbols.youtube, title: "YouTube")
    private let presskitItemView = FKLinkItemView(systemName: SFSymbols.presskit, title: "PressKit")
    private let articleItemView = FKLinkItemView(systemName: SFSymbols.article, title: "Article")
    private let wikipediaItemView = FKLinkItemView(systemName: SFSymbols.wikipedia, title: "Wikipedia")
    
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
        configureItems()
    }
    
    @objc private func youtubeItemPressed() {
        guard
            let urlString = launch.links?.webcast,
            let url = URL(string: urlString) else {
            
            presentFKAlertVC(alerTitle: FKError.title.rawValue, alertBody: FKError.noAvailableContent.rawValue, alertButtonTitle: "Ok")
            return
        }
        
        presentSafariVC(url: url)
    }
    
    @objc private func pressKitPressed() {
        guard
            let urlString = launch.links?.presskit,
            let url = URL(string: urlString) else {
            
            presentFKAlertVC(alerTitle: FKError.title.rawValue, alertBody: FKError.noAvailableContent.rawValue, alertButtonTitle: "Ok")
            return
        }
        
        presentSafariVC(url: url)
    }
    
    @objc private func articlePressed() {
        guard
            let urlString = launch.links?.article,
            let url = URL(string: urlString) else {
            
            presentFKAlertVC(alerTitle: FKError.title.rawValue, alertBody: FKError.noAvailableContent.rawValue, alertButtonTitle: "Ok")
            return
        }
        
        presentSafariVC(url: url)
    }
    
    @objc private func wikipediaPressed() {
        guard
            let urlString = launch.links?.wikipedia,
            let url = URL(string: urlString) else {
            
            presentFKAlertVC(alerTitle: FKError.title.rawValue, alertBody: FKError.noAvailableContent.rawValue, alertButtonTitle: "Ok")
            return
        }
        
        presentSafariVC(url: url)
    }
}

extension FKLinksVC {
    private func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureItems() {
        view.addSubviews(youtubeItemView, presskitItemView, articleItemView, wikipediaItemView)
        
        for item in [youtubeItemView, presskitItemView, articleItemView, wikipediaItemView] {
            item.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(CGFloat.itemHeight)
            }
        }
        
        youtubeItemView.snp.makeConstraints({ $0.top.equalToSuperview() })
        presskitItemView.snp.makeConstraints({ $0.top.equalTo(youtubeItemView.snp.bottom).offset(CGFloat.margin) })
        articleItemView.snp.makeConstraints({ $0.top.equalTo(presskitItemView.snp.bottom).offset(CGFloat.margin) })
        wikipediaItemView.snp.makeConstraints({ $0.top.equalTo(articleItemView.snp.bottom).offset(CGFloat.margin) })
        
        youtubeItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(youtubeItemPressed)))
        presskitItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressKitPressed)))
        articleItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(articlePressed)))
        wikipediaItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(wikipediaPressed)))
    }
}
