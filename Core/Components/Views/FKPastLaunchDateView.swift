//
//  FKPastLaunchDateView.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import UIKit
import SnapKit

final class FKPastLaunchDateView: UIView {
    
    private struct Constants {
        static let lauchDate = "Launch Date:"
    }
    
    private var prefixLabel: FKBodyLabel!
    private var dateLabel: FKTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        configurePrefixLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(launch: Launch) {
        dateLabel.text = launch._launchDate
    }
    
    private func configurePrefixLabel() {
        prefixLabel = FKBodyLabel(text: Constants.lauchDate, textAlignment: .left, fontSize: .title2)
        addSubview(prefixLabel)
        
        let width = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 76 : 100
        prefixLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.bottom.equalTo(snp.bottom)
            make.width.equalTo(width)
        }
    }
    
    private func configureDateLabel() {
        dateLabel = FKTitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(prefixLabel.snp.trailing).offset(4)
            make.bottom.equalTo(snp.bottom)
            make.trailing.equalTo(snp.trailing)
        }
    }
}
