//
//  FKImageView.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import UIKit

final class FKImageView: UIImageView {
    
    private var dataTask: URLSessionDataTask?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        contentMode = .scaleAspectFit
        clipsToBounds = true
        
        backgroundColor = .systemGray4
        
        tintColor = .red
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = bounds.width / 2
    }
    
    func download(urlString: String) {
        
        if let cachedImage = CacheManager.shared.getFromCache(urlString: urlString) {
            image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        dataTask = NetworkManager.shared.download(url: url, completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.handleWithData(data, urlString: urlString)
            case .failure(_):
                break
            }
        })
    }
    
    func cancelDownloading() {
        dataTask?.cancel()
        dataTask = nil
    }
    
    private func handleWithData(_ data: Data, urlString: String) {
        if let downloadedImage = UIImage(data: data) {
            CacheManager.shared.addToCache(urlString: urlString, image: downloadedImage)
            DispatchQueue.main.async {
                self.image = downloadedImage
            }
        }
    }
}
