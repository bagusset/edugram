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
                if error != nil {
                    let alert2 = UIAlertController(title: "Input Invalid", message: "Do you want register ?", preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) -> Void in
                        self?.performSegue(withIdentifier: "segueToRegister", sender: self)
                    }))
                    alert2.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                    self?.present(alert2, animated: true)
                } else {
                    let alert1 = UIAlertController(title: "Berhasil", message: "Login Berhasil", preferredStyle: .alert)
                    alert1.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self?.present(alert1, animated: true)
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
