//
//  Networking.swift
//  Devskiller
//
//  Created by Fernando Douglas Vieira on 06/02/23.
//  Copyright © 2023 Mindera. All rights reserved.
//

import Foundation

class Networking {
    
    static let shared = Networking()
    private let session = URLSession.shared
    
    func get<T: Decodable>(model: T.Type, endPoint: URL, completion: @escaping (_ result: Result<T, Error>) -> Void) {
        
        let request = URLRequest(url: endPoint)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let data else {
                completion(.failure(NSError(domain: "Data not found", code: 999)))
                return
            }
            
            let result = Result { try JSONDecoder().decode(T.self, from: data) }
            completion(result)
    
        }
        task.resume()
    }
    
}
