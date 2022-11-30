//
//  NetworkManager.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func download(url: URL, completion: @escaping (Result<Data, FKError>) -> ()) -> URLSessionDataTask
    func handleWithData<T: Decodable>(_ data: Data, type: T.Type) -> T?
    func handleWithError(_ error: Error)
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    private init() {}
    
    @discardableResult
    func download(url: URL, completion: @escaping (Result<Data, FKError>) -> ()) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                print(FKError.unableToComplete)
                completion(.failure(.unableToComplete))
                return
            }
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                
                print(FKError.invalidResponse)
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                print(FKError.invalidData)
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(data))
        }
        
        dataTask.resume()
        return dataTask
    }
    
    func handleWithData<T: Decodable>(_ data: Data, type: T.Type) -> T? {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            print(FKError.unableToParseFromJSON.rawValue)
            return nil
        }
    }
    
    func handleWithError(_ error: Error) {
        print(error)
    }
}
