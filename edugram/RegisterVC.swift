//
//  RegisterVC.swift
//  edugram
//
//  Created by Bagus setiawan on 13/01/21.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterVC: UIViewController {
    
    @IBOutlet weak var regEmail: UITextField!
    @IBOutlet weak var regPassword: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBtn()
    }
    
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = regEmail.text, let password = regPassword.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil{
                    let alert2 = UIAlertController(title: "Input Invalid", message: "Please input again", preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert2, animated: true)
                } else {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
        
    }
    
    func configureBtn(){
        signInBtn.backgroundColor = #colorLiteral(red: 0, green: 0.665512979, blue: 1, alpha: 1)
        signInBtn.layer.cornerRadius = 10
        signInBtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    
    
}
