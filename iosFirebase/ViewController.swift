//
//  ViewController.swift
//  iosFirebase
//
//  Created by Abilio Azevedo on 8/4/17.
//  Copyright © 2017 Marcos Moreira. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do{
         try Auth.auth().signOut()
        }catch{
            print("Não deu logout")
        }
        
        // [START log_fcm_reg_token]
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        // [END log_fcm_reg_token]
        
        Messaging.messaging().subscribe(toTopic: "news")
        print("Subscribed to news topic")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func login(_ sender: Any) {
        
        if (email.text == "" || email.text == nil) && (senha.text == "" || senha.text == nil){
            
            self.labelError.text = "Insira um nome de usuário e senha."
            
        } else if let emailUsuario = email.text, let senhaUsuario = senha.text {
            
            Auth.auth().signIn(withEmail: emailUsuario, password: senhaUsuario){ (user, error) in
                
                if let error = error{
                    print("Deu ruim")
                    print(error)
                    self.labelError.text = error.localizedDescription
                    return
                }else{
                    print("Deu bom")
                }
            }
        }
    }
    
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
    }
    
    @IBAction func handleLogTokenTouch(_ sender: UIButton) {
        // [START log_fcm_reg_token]
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        // [END log_fcm_reg_token]
    }
    
    @IBAction func handleSubscribeTouch(_ sender: UIButton) {
        // [START subscribe_topic]
        Messaging.messaging().subscribe(toTopic: "news")
        print("Subscribed to news topic")
        // [END subscribe_topic]
    }
}

