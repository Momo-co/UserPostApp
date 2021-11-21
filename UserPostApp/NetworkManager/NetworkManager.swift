//
//  NetworkManager.swift
//  UserPostApp
//
//  Created by Suman Gurung on 21/11/2021.
//

import Foundation
protocol NetworkingProtocol: AnyObject {
    func passUser(users: [Users])
}

class NetworkManager {
    
    weak var networkDelegate:NetworkingProtocol?
    func getUsers() {
        
        let urlSession = URLSession.shared
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        let dataTask = urlSession.dataTask(with: url) { data, urlResponse, error in
            let jsonDecoder = JSONDecoder()
            
            guard let _data = data else {
                return
            }
            
            do {
                let users = try jsonDecoder.decode([Users].self, from: _data)
                self.networkDelegate?.passUser(users: users)

            } catch {
                print(error.localizedDescription)
            }
        }
        
        dataTask.resume()
    }
}
