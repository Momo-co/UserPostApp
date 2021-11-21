//
//  PostsViewController.swift
//  UserPostApp
//
//  Created by Suman Gurung on 18/11/2021.
//

import UIKit

class PostsViewController: UIViewController {
    
    var user:Users?
    weak var delegate:PassNameProtocol?
    var completionBlock:((String)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func clickSumanButton(_ sender: Any) {
        let name = (sender as! UIButton).titleLabel?.text
        
        if let _completionBlock = completionBlock {
            _completionBlock(name ?? "")
        }
        //delegate?.updateHello(name: name ?? "")
        
        //self.navigationController?.popViewController(animated: true)
        let settingViewController = SettingViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
    
    @IBAction func clickGeetanjaliButton(_ sender: Any) {
        let name = (sender as! UIButton).titleLabel?.text
        
        if let _completionBlock = completionBlock {
            _completionBlock(name ?? "")
        }
        //delegate?.updateHello(name: name ?? "")
        
        //self.navigationController?.popViewController(animated: true)
        let settingViewController = SettingViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
    
    @IBAction func clickDavidButton(_ sender: Any) {
        let name = (sender as! UIButton).titleLabel?.text
        
        if let _completionBlock = completionBlock {
            _completionBlock(name ?? "")
        }
        //delegate?.updateHello(name: name ?? "")
        
        //self.navigationController?.popViewController(animated: true)
        let settingViewController = SettingViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
