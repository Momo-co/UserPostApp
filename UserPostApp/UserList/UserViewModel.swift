//
//  UserPresenter.swift
//  UserPostApp
//
//  Created by Suman Gurung on 21/11/2021.
//

import Foundation 

class UserViewModel {
    @Published private(set) var users:[Users] = []
    
    var numberOfUsers:Int {
        return users.count
    }
    private let networkManager = NetworkManager()
    
    func getUsers() {
        networkManager.getUsers(urlString: "https://jsonplaceholder.typicode.com/users", type: Users.self) { result in
            switch result {
            case.success(let users):
                self.users = users
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func getAUser(index: Int) -> Users {
        return users[index]
    }
}

