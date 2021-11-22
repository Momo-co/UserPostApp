//
//  UserPresenter.swift
//  UserPostApp
//
//  Created by Suman Gurung on 21/11/2021.
//

import Foundation

class UserPresenter {
    private var users:[Users] = []
    
    var numberOfUsers:Int {
        return users.count
    }
    private let networkManager = NetworkManager()
    
    func getUsers(completionHandler:@escaping(Bool)->Void) {
        networkManager.getUsers(urlString: "https://jsonplaceholder.typicode.com/users", type: Users.self) { result in
            switch result {
            case.success(let users):
                self.users = users
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                completionHandler(true)
            }
        }
    }
    
    func getAUser(index: Int) -> Users {
        return users[index]
    }
}

