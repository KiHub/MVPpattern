//
//  NetworkService.swift
//  MVP5
//
//  Created by  Mr.Ki on 21.03.2022.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
    func getComents(completion: @escaping (Result<[Coment]?, Error>) -> Void)
}

class NetworkServoce: NetworkServiceProtocol {
    func getComents(completion: @escaping (Result<[Coment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Coment].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
