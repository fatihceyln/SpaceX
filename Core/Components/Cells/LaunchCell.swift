//
//  LaunchCell.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import UIKit
import SnapKit

final class LaunchCell: UICollectionViewCell {
    
    static let reuseID = "LaunchCell"
    
    private var imageView: FKImageView!
    private var stackView: FKStackView!
    private var nameLabel: FKTitleLabel!
    private var dateLabel: FKBodyLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
        configureImageView()
        configureStackView()
        configureNameLabel()
        configureDateLabel()
        
        showDisclosureIndicator(size: CGFloat.indicatorSize, tintColor: .theme.secondary)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(launch: Launch) {
        nameLabel.text = launch.name ?? ""
        dateLabel.text = launch._launchDate
        if let urlString = launch.links?.patch?.small {
            imageView.download(urlString: urlString)
        } else {
            imageView.image = Images.noImage
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        dateLabel.text = nil
        
        imageView.image = nil
        imageView.cancelDownloading()
    }
    
    private func configure() {
        backgroundColor = .theme.background
        layer.cornerRadius = .cornerRadius
        layer.borderColor = UIColor.theme.border?.cgColor
        layer.borderWidth = .borderWidth
    }
    
    private func configureStackView() {
        stackView = FKStackView(axis: .vertical)
        addSubview(stackView)
        
        stackView.spacing = .padding / 2
        stackView.alignment = .leading
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(2 * CGFloat.padding)
            make.trailing.equalTo(snp.trailing).offset(-2 * .padding)
        }
    }
    
    private func configureImageView() {
        imageView = FKImageView(frame: .zero)
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(snp.leading).offset(2 * CGFloat.padding)
            make.width.equalTo(snp.height).multipliedBy(0.7)
            make.height.equalTo(snp.height).multipliedBy(0.7)
        }
    }
    
    private func configureNameLabel() {
        nameLabel = FKTitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        stackView.addArrangedSubview(nameLabel)
    }
    
    private func configureDateLabel() {
        dateLabel = FKBodyLabel(text: "Test", textAlignment: .left, fontSize: .body)
        stackView.addArrangedSubview(dateLabel)
    }
}
