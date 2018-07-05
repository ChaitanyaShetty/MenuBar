//
//  MenuViewController.swift
//  MenuBar
//
//  Created by SMSCountry Networks Pvt. Ltd on 17/05/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit

public protocol MenuOptionsClickedDelegate : NSObjectProtocol {
    func tapGestureClicked()
    func profileClicked()
}

class MenuViewController: UIViewController, MenuOptionsClickedDelegate {
   
      var delegateIs : MenuOptionsClickedDelegate!
    @IBOutlet var viewOnMenuOptions: UIView!
    @IBOutlet var viewOnProfileInfo: UIView!
    
    @IBOutlet var imgOfbackGrn: UIImageView!
    
    
    func tapGestureClicked() {
        
    }
    
    func profileClicked() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func bindUserData(){
        
        let tapGestureTopInfo = UITapGestureRecognizer.init(target: self, action: #selector(taponTopInfo))
        viewOnProfileInfo.addGestureRecognizer(tapGestureTopInfo)
        
    }
    
     @objc func taponTopInfo(){
        if self.delegateIs != nil {
            self.delegateIs.profileClicked()
        }
    }

}
