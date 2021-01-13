//
//  ViewController.swift
//  edugram
//
//  Created by Bagus setiawan on 12/01/21.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPass: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertLabel.isHidden = true
        configureButton()
    }
    
    @IBAction func loginPress(_ sender: UIButton) {
        if let email = inputEmail.text, let password = inputPass.text {
            Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self?.performSegue(withIdentifier: "loginSegue", sender: self)
                }
            }
        }
        
    }
    
    func configureButton(){
        loginBtn.backgroundColor = #colorLiteral(red: 0, green: 0.665512979, blue: 1, alpha: 1)
        loginBtn.layer.cornerRadius = 10
        loginBtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}
