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

    let userPresenter = UserPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userPresenter.getUsers { isLoaded in
            if isLoaded {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPresenter.numberOfUsers
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UsersTableViewCell else {
            return UITableViewCell()
        }
        
        let cellUser = userPresenter.getAUser(index: indexPath.row)
        
        cell.nameLabel.text = "\(cellUser.name)"
        
        cell.userNameLabel.text = "User Name: \(cellUser.userName)"
        
        cell.emailLabel.text = "Email: \(cellUser.email)"
        
        cell.websiteLabel.text = "Website: \(cellUser.website)"
        
        cell.companyNameLabel.text = "Company Name: \(cellUser.company.name)"
        
        cell.phoneLabel.text = "Phone: \(cellUser.phone)"
        
        cell.shareDelegate = self
        
        cell.shareClosure = { name in
            self.updateHello(name: name)
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let postsViewController = storyBoard.instantiateViewController(withIdentifier: "PostsDetails") as? PostsViewController else {
            return
        }
        
        let user = userPresenter.getAUser(index: indexPath.row)
        
        postsViewController.user = user
        
        postsViewController.delegate = self
        
        postsViewController.completionBlock = { name in
            self.updateHello(name: name)
        }
        
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
