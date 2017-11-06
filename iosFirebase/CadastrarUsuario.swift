//
//  CadastrarUsuario.swift
//  iosFirebase
//
//  Created by Abilio Azevedo on 8/9/17.
//  Copyright © 2017 Marcos Moreira. All rights reserved.
//

import UIKit
import Firebase

class CadastrarUsuario: UIViewController {
    
    
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FirebaseApp.configure()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cadastrar(_ sender: Any) {
        var _: String = nome.text!
        let emailUsuario: String = email.text!
        let senhaUsuario: String = senha.text!
        
        Auth.auth().createUser(withEmail: emailUsuario, password: senhaUsuario){ (user, error) in
            
            if let error = error {
                print(error)
                return
            }
        }
    }
}
