//
//  UsuarioLogado.swift
//  iosFirebase
//
//  Created by Abilio Azevedo on 8/10/17.
//  Copyright © 2017 Marcos Moreira. All rights reserved.
//

import UIKit
import Firebase

class UsuarioLogado: UIViewController {
    
    @IBOutlet weak var usuarioAtual: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let email = Auth.auth().currentUser {
            usuarioAtual.text = email.email
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
