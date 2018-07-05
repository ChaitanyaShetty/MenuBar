//
//  ViewController.swift
//  MenuBar
//
//  Created by SMSCountry Networks Pvt. Ltd on 17/05/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leftMenu : MenuViewController!
    var isMenuvisible : Bool!
    let menuWidth = 280

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        createMenu()
        toHideMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        leftMenu.bindUserData()
        toHideMenu()
    }
    
    func createMenu() {
       
        leftMenu = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        leftMenu.delegateIs = self as MenuOptionsClickedDelegate
        leftMenu.view.translatesAutoresizingMaskIntoConstraints = true
        leftMenu.view.frame = CGRect(x: -Int(UIScreen.main.bounds.size.width), y: 0, width: Int(UIScreen.main.bounds.size.width), height: Int(UIScreen.main.bounds.size.height))
        leftMenu.viewOnMenuOptions.translatesAutoresizingMaskIntoConstraints = true
        leftMenu.view.frame = CGRect(x: 0, y: 0, width: menuWidth, height: Int(UIScreen.main.bounds.size.height))
        self.view.addSubview(leftMenu.view)
        
        //adding gestures
        let rightSwipe = UISwipeGestureRecognizer.init(target: self, action: #selector(swipeRightCalled))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer.init(target: self, action: #selector(swipeLeftCalled))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        
        leftMenu.bindUserData()
        
        isMenuvisible = false
        
    }
    
    @objc func swipeLeftCalled() {
        if isMenuvisible == true {
            toHideMenu()
        }
    }
    
    
    @objc func swipeRightCalled() {
        
        if isMenuvisible == false {
            toShowMenu()
        }
    }
    
    
    
    func toShowMenu(){
        
   
        leftMenu.view.translatesAutoresizingMaskIntoConstraints = true
        leftMenu.viewOnMenuOptions.isHidden = false
        
        
        UIView.animate(withDuration: 1, animations: {
            
            self.leftMenu.view.frame = CGRect(x: -Int(UIScreen.main.bounds.size.width), y: 0, width: Int(UIScreen.main.bounds.size.width), height: Int(UIScreen.main.bounds.size.height))
            
            self.leftMenu.view.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: Int(UIScreen.main.bounds.size.height))
            
           self.leftMenu.bindUserData()
            
        }) { (isvisble) in
            
            self.isMenuvisible = true
        }
        
        
    }
    
    
    
    func toHideMenu(){
        
        leftMenu.view.translatesAutoresizingMaskIntoConstraints = true
        leftMenu.imgOfbackGrn.alpha = 0.5
        leftMenu.viewOnMenuOptions.isHidden = true
        UIView.animate(withDuration: 1, animations: {
            
            self.leftMenu.view.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: Int(UIScreen.main.bounds.size.height))
            
            self.leftMenu.view.frame = CGRect(x: -Int(UIScreen.main.bounds.size.width), y: 0, width: Int(UIScreen.main.bounds.size.width), height: Int(UIScreen.main.bounds.size.height))
            
       
            
            
        }) { (isvisible) in
            
            self.isMenuvisible = false
            
        }
        
        
        
    }
    

    @IBAction func menuBtnTapped(_ sender: Any) {
        leftMenu.viewOnMenuOptions.isHidden = false
        if isMenuvisible == false {
            toShowMenu()
        }
        else{
            toHideMenu()
        }
    }
    
}

extension ViewController : MenuOptionsClickedDelegate {
    func tapGestureClicked() {
        toHideMenu()
    }
    
    func profileClicked() {
        let profileVc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(profileVc, animated: true)
    //    self.navigationController?.present(profileVc, animated: true, completion: nil)
        
    }
    
    
    
}

