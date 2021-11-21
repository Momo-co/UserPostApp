//
//  SettingViewController.swift
//  UserPostApp
//
//  Created by Suman Gurung on 20/11/2021.
//

import UIKit

class SettingViewController: UIViewController {

    let helloLabel = UILabel()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        helloLabel.text = "Hello Setting"
        self.view.addSubview(helloLabel)
        
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        
        helloLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10.0).isActive = true
        
        helloLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0).isActive = true
        
        self.view.addSubview(tableView)
        // mandatory to set this to false when giving constraints programatically
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5.0),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 5.0),
            tableView.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 5.0),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 5.0)
        ])
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

