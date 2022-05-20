//
//  AddTaskViewController.swift
//  lesson3
//
//  Created by Умар on 14/5/22.
//

import Foundation
import SnapKit
import UIKit
class AddTaskViewController : UIViewController{
    @objc func addTaskSelector() {
        
        let title = titleTextField.text
        let description = descriptionTextField.text
       
        if title != ""{
            taskInfo.insert((Model(title: title!, description: description!, status: false)), at: 0)

            let rootVC = TasksTableViewController()
            let view = UINavigationController(rootViewController: rootVC)
            view.modalPresentationStyle = .fullScreen
            present(view, animated: true)
        }else{
        
            print("noo value")
        }
    }
    
    private var titleLabel:UILabel = {
        let view = UILabel()
        view.text = "Title"
        view.textColor = .black
        return view
    }()
    
    private var descriptionLabel:UILabel = {
        let view = UILabel()
        view.text = "Descriptioin"
        view.textColor = .black
        return view
    }()
    
    
    private var titleTextField:UITextField = {
        let view = UITextField()
        view.borderStyle = .line
         return view
    }()
    private var descriptionTextField:UITextField = {
        let view  = UITextField()
        view.borderStyle = .line

        return view
    }()
    private var plusButton:UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = UIColor.rgb(red: 251, green: 231, blue: 231)

        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.addTarget(self, action: #selector(addTaskSelector), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTextField)
        view.addSubview(plusButton)
        titleLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(140)
            make.leading.equalToSuperview().offset(50)
        }
        titleTextField.snp.makeConstraints{make in
            make.top.equalTo(titleLabel).offset(22)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        descriptionLabel.snp.makeConstraints{make in
            make.top.equalTo(titleTextField).offset(80)
            make.leading.equalToSuperview().offset(50)
        }
        descriptionTextField.snp.makeConstraints{make in
            make.top.equalTo(descriptionLabel).offset(22)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(400)
        }
        plusButton.snp.makeConstraints{make in
            make.top.equalTo(descriptionTextField.snp.bottom).offset(40)
            make.centerX.equalTo(descriptionTextField)
            make.width.equalTo(120)
            make.height.equalTo(40)        }
        
    }
    
}

