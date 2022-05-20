//
//  SignUpViewController.swift
//  homeWork1(Tasks)
//
//  Created by Умар on 12/5/22.
//

import Foundation
import UIKit
var dataStore: [String: String] = [:]


class SIgnUpViewController: UIViewController{
    let store = LocalStore.shared
    func signUpUser() {
            store.user = Users(name: nameTextField.text ?? "", password: passwordTextField.text ?? "")
            print(store.user?.name ?? "")
            print(store.user?.password ?? "")
       

     }
    
    @objc func sendToFirstPage(){
        let password = passwordTextField.text!
                let name = nameTextField.text!
                dataStore[name] = password
                if dataStore[name] == ""{
                    return
                }else{
                    signUpUser()

                    print( "Successfully Signed Up!")
                    let rootVC = ViewController()
                    navigationController?.pushViewController(rootVC, animated: true)
                }
 

        
        
    }
    private lazy var  signUpButton : UIButton = {

        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
 
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(sendToFirstPage), for: .touchUpInside)
        return button
        
    }()
    lazy var name = UILabel()
    lazy var password = UILabel()
    lazy var nameTextField = UITextField()
    lazy var passwordTextField = UITextField()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        name.text = "Name"
        password.text = "Password"
        nameTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .blue
        view.backgroundColor = .white
        
        view.addSubview(name)
        view.addSubview(nameTextField)
        view.addSubview(password)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints{make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(140)
            make.leading.equalToSuperview().offset(165)
          }
        
        passwordTextField.snp.makeConstraints{make in
            make.top.equalTo(password.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        password.snp.makeConstraints{ make in
            make.top.equalTo(nameTextField.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(40)

        }
        
        nameTextField.snp.makeConstraints{ make in
            make.top.equalTo(name.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        
        
        
        name.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(350)
            make.leading.equalToSuperview().offset(40)
            
        }
 
    
    


    }
    
}
