//
//  ViewController.swift
//  homeWork1(Tasks)
//
//  Created by Умар on 11/5/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    @objc func sendToSignUpPage(){
        let rootVC = SIgnUpViewController()
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    @objc func sendToAddTaskPage(){
            let name = nameTextField.text
            let password = passwordTextField.text

            if dataStore[name!] == password  {
                let rootVC = TasksTableViewController()
                navigationController?.pushViewController(rootVC, animated: true)
                
            }else{
                changeLabel.text = "Incorrect"
    
            }
        }
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
 
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(sendToSignUpPage), for: .touchUpInside)
        return button
        
    }()
     

   
    private lazy var signInButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(sendToAddTaskPage), for: .touchUpInside)
        return button
    }()
    lazy var name = UILabel()
    lazy var password = UILabel()
    lazy var nameTextField = UITextField()
    lazy var passwordTextField = UITextField()
    
    private lazy var changeLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium)
        text.text = ""
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        name.text = "Name"
        password.text = "Password"
        nameTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect
         
        view.backgroundColor = .white
        
        view.addSubview(changeLabel)
        view.addSubview(signUpButton)
        view.addSubview(name)
        view.addSubview(nameTextField)
        view.addSubview(password)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        
        
        changeLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
        signInButton.snp.makeConstraints{make in
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

        signUpButton.snp.makeConstraints{ make in
           
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(320)
            
            
            
        }
    
    


    }
}




