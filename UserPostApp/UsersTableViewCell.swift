//
//  UserTableViewCell.swift
//  UserPostApp
//
//  Created by Suman Gurung on 18/11/2021.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var websiteLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    
    weak var shareDelegate:ShareNameProtocol?
    var shareClosure:((String)->Void)?
    
    @IBAction func shareButton(_ sender: Any) {
        let name = self.nameLabel.text
        
        if let _shareClosure = shareClosure {
            _shareClosure(name ?? "")
        }
        //shareDelegate?.helloUser(name: name ?? "")
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
