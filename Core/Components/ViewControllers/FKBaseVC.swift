//
//  FKBaseVC.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 20.11.2022.
//

import UIKit
import SnapKit

class FKBaseVC: UIViewController {
    
    private var containerView: UIView!
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .black.withAlphaComponent(0)
        
        UIView.animate(withDuration: 0.3) {
            self.containerView.backgroundColor = .black.withAlphaComponent(0.65)
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.color = .white
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        guard containerView != nil else { return }
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.containerView.backgroundColor = .black.withAlphaComponent(0)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
}

