//
//  FKLaunchHeaderView.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import UIKit
import SnapKit

final class FKLaunchHeaderView: UIView {
    
    private var imageView: FKImageView!
    private var launchName: FKTitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        configureImageView()
        configureLaunchNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(launch: Launch) {
        launchName.text = launch._name
        
        if let urlString = launch.links?.patch?.small {
            imageView.download(urlString: urlString)
        } else {
            imageView.image = Images.noImage
        }
    }
    
    private func configureImageView() {
        imageView = FKImageView(frame: .zero)
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
            make.height.equalTo(imageView.snp.width)
        }
    }
    
    private func configureLaunchNameLabel() {
        launchName = FKTitleLabel(text: "", textAlignment: .left, fontSize: .largeTitle)
        addSubview(launchName)
        
        launchName.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.trailing.equalTo(snp.trailing)
            make.centerY.equalTo(snp.centerY)
        }
    }
}
