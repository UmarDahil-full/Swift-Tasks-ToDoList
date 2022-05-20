 
   
//
//  TargetViewController.swift
//  lesson1
//
//  Created by Шермат Эшеров on 4/5/22.
//
import UIKit

class TargetViewController: UIViewController {
    
    
    @objc func configureNavbar() {
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func addTaskSelector(){
        
        let rootVC = AddTaskViewController()
        let view = UINavigationController(rootViewController: rootVC)
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true)
        
    }
    
    @objc func showReadyTasks(sender: UIButton) {
        sender.backgroundColor = .white
        inProgressButton.backgroundColor = nil
         
    }
    
    @objc func showInProgressTasks(sender: UIButton) {
        sender.backgroundColor = .white
        readyButton.backgroundColor = nil
        
        let rootVC = InProgressTableViewController()
        let view = UINavigationController(rootViewController: rootVC)
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true)

    }
    
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(configureNavbar))
        
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        return button
    }()
    
    private lazy var bgButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        view.layer.cornerRadius = 9
        return view
    }()
    
    private lazy var readyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ready", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 6.93
        button.addTarget(self, action: #selector(showReadyTasks), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var inProgressButton: UIButton = {
        let button = UIButton()
        button.setTitle("In Progress", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 6.93
        button.addTarget(self, action: #selector(showInProgressTasks(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var addTask: UIButton = {
        let button = UIButton()
        button.setTitle("Add Task", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 251, green: 231, blue: 231)
        button.setTitleColor(UIColor.rgb(red: 0, green: 0, blue: 0), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(addTaskSelector), for: .touchUpInside)
        return button
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(backButton)
        view.addSubview(bgButtonView)
        
        view.addSubview(addTask)
        
        bgButtonView.translatesAutoresizingMaskIntoConstraints = false
        bgButtonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        bgButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bgButtonView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bgButtonView.widthAnchor.constraint(equalToConstant: 330).isActive = true
        
        bgButtonView.addSubview(readyButton)
        bgButtonView.addSubview(inProgressButton)
        
        readyButton.translatesAutoresizingMaskIntoConstraints = false
        inProgressButton.translatesAutoresizingMaskIntoConstraints = false

        inProgressButton.trailingAnchor.constraint(equalTo: bgButtonView.trailingAnchor, constant: -5).isActive = true
        inProgressButton.centerYAnchor.constraint(equalTo: bgButtonView.centerYAnchor, constant: 0).isActive = true
        inProgressButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        readyButton.centerYAnchor.constraint(equalTo: bgButtonView.centerYAnchor, constant: 0).isActive = true
        readyButton.leadingAnchor.constraint(equalTo: bgButtonView.leadingAnchor, constant: 5).isActive = true
        readyButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        
        
        addTask.translatesAutoresizingMaskIntoConstraints = false
        
        addTask.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        addTask.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        addTask.widthAnchor.constraint(equalToConstant: 230).isActive = true
        addTask.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
}


 
