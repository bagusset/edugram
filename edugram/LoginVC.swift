//
//  ViewController.swift
//  edugram
//
//  Created by Bagus setiawan on 12/01/21.
//

import UIKit

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
    
    @IBAction func loginTab(_ sender: Any) {
        if inputEmail.text == "Bagus" && inputPass.text == "1234"{
            alertLabel.text = "Berhasil"
            alertLabel.isHidden = false
        } else {
            alertLabel.isHidden = false
            alertLabel.text = "Gagal"
            alertLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0, alpha: 1)
        }
    }
    
    func configureButton(){
        loginBtn.backgroundColor = #colorLiteral(red: 0, green: 0.665512979, blue: 1, alpha: 1)
        loginBtn.layer.cornerRadius = 10
        loginBtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}





