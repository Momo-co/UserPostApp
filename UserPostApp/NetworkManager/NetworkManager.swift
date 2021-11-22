//
//  NetworkManager.swift
//  UserPostApp
//
//  Created by Suman Gurung on 21/11/2021.
//

import Foundation


class NetworkManager {
    
    func getUsersResult() {
        
    }
    
    func getUsers<T:Decodable>(urlString: String, type:T.Type, completionHandler:(@escaping(Result<[T], Error>)->Void)) {
        
        let urlSession = URLSession.shared
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let dataTask = urlSession.dataTask(with: url) { data, urlResponse, error in

            
            guard let _data = data else {
                completionHandler(.failure(error as! Error))
                return
            }
            let jsonDecoder = JSONDecoder()
            
            do {
                let users = try jsonDecoder.decode([T].self, from: _data)
                completionHandler(.success(users))

            } catch {
                completionHandler(.failure(error))
            }
        }
        
        dataTask.resume()
    }
}
