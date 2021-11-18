//
//  ViewController.swift
//  UserPostApp
//
//  Created by Suman Gurung on 18/11/2021.
//

import UIKit

protocol PassNameProtocol: AnyObject {
    func updateHello(name: String)
}

protocol ShareNameProtocol: AnyObject {
    func helloUser(name: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var users:[Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getUsers()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
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
                self.users = try jsonDecoder.decode([Users].self, from: _data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        dataTask.resume()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UsersTableViewCell else {
            return UITableViewCell()
        }
        
        let cellUser = users[indexPath.row]
        
        cell.nameLabel.text = "\(cellUser.name)"
        
        cell.userNameLabel.text = "User Name: \(cellUser.userName)"
        
        cell.emailLabel.text = "Email: \(cellUser.email)"
        
        cell.websiteLabel.text = "Website: \(cellUser.website)"
        
        cell.companyNameLabel.text = "Company Name: \(cellUser.company.name)"
        
        cell.phoneLabel.text = "Phone: \(cellUser.phone)"
        
        cell.shareDelegate = self
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let postsViewController = storyBoard.instantiateViewController(withIdentifier: "PostsDetails") as? PostsViewController else {
            return
        }
        
        let user = users[indexPath.row]
        
        postsViewController.user = user
        
        postsViewController.delegate = self
        
        self.navigationController?.pushViewController(postsViewController, animated: true)
    }
}

extension ViewController: PassNameProtocol {
    func updateHello(name: String) {
        helloLabel.text? = "Hello \(name)"
    }
}

extension ViewController: ShareNameProtocol {
    func helloUser(name: String) {
        helloLabel.text? = "Hello \(name)"
    }
}
