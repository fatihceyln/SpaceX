//
//  LaunchService.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import Foundation

protocol LaunchServiceProtocol {
    func downloadLaunches(type: LaunchType, completion: @escaping ([Launch]?) -> ())
    func downloadLaunchDetail(id: String, completion: @escaping (Launch?) -> ())
}

final class LaunchService: LaunchServiceProtocol {
    
    func downloadLaunches(type: LaunchType, completion: @escaping ([Launch]?) -> ()) {
        
        var urlString = ""
        
        switch type {
        case .upcoming:
            urlString = APIURLs.upcomnigLaunches
        case .past:
            urlString = APIURLs.pastLaunches
        }
        
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let _ = self else { return }
            
            switch result {
            case .success(let data):
                completion(NetworkManager.shared.handleWithData(data, type: [Launch].self))
            case .failure(let error):
                NetworkManager.shared.handleWithError(error)
                completion(nil)
            }
        }
    }
    
    func downloadLaunchDetail(id: String, completion: @escaping (Launch?) -> ()) {
        
        guard let url = URL(string: APIURLs.launchDetail(id: id)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let _ = self else { return }
            
            switch result {
            case .success(let data):
                completion(NetworkManager.shared.handleWithData(data, type: Launch.self))
            case .failure(let error):
                NetworkManager.shared.handleWithError(error)
                completion(nil)
            }
        }
    }
}
