//
//  UIViewController+Ext.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func presentFKAlertVC(alerTitle: String, alertBody: String, alertButtonTitle: String) {
        let alertVC = FKAlertVC(alertTitle: alerTitle, alertBody: alertBody, alertButtonTitle: alertButtonTitle)
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overFullScreen
        present(alertVC, animated: true)
    }
    
    func presentSafariVC(url: URL) {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
