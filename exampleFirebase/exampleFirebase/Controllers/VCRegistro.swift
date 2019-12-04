//
//  VCRegistro.swift
//  exampleFirebase
//
//  Created by Sergio Redondo on 20/10/2019.
//  Copyright © 2019 NBTech. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class VCRegistro: UIViewController {
    
    @IBOutlet var txtfRegMail:UITextField?
    @IBOutlet var txtfRegPass:UITextField?
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtNickName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSignUp() {
        
        if let email = txtfRegMail?.text, let pass = txtfRegPass?.text {
            Auth.auth().createUser(withEmail: email, password: pass) { (authDataResult, error) in
                if(error == nil){
                    let user = Auth.auth().currentUser
                    if let user = user {
                        DataHolder.sharedInstance.userAuth = user
                        //TODO: Guardar datos en firestore
                    }
                }
                
            }
        } else{
            print("error")
            //TODO: control de errores
        }
        
        
    }

}
