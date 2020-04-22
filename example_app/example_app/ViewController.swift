//
//  ViewController.swift
//  example_app
//
//  Created by Sergio Redondo on 20/04/2020.
//  Copyright © 2020 NBTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblPass: UILabel!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUser.text = "User"
        lblPass.text = "Pass"
    }

    func login(user:String, pass:String) -> Bool {
        if(user=="user" && pass=="1234"){
            lblError.isHidden = true
            return true
        }else{
            lblError.isHidden = false
            lblError.text = "Usuario o contraseña erroneos"
            return false
        }
    }
    
    
    @IBAction func actionLogin(_ sender: UIButton) {
        
        if(login(user: txtUser.text!, pass: txtPass.text!)){
            print("entro")
            performSegue(withIdentifier: "segueLogin", sender: self)
        }else{
            print("no entro")
        }
    }
    
}

