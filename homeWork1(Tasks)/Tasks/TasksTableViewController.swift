//
//  ViewController.swift
//  lesson3
//
//  Created by Умар on 12/5/22.
//

import UIKit
import SnapKit
class TasksTableViewController: UIViewController, UITableViewDelegate {
    var readyTasks: [Model] = []
    var inProgressTasks: [Model] = []
    
    @objc func configureNavbar() {
        dismiss(animated: true, completion: nil)
        
    }
    var isReady:Bool = true

    @objc func goToAddTaskViewController(sender:UIButton) {
        let rootVC = AddTaskViewController()
        sender.backgroundColor = .white
        let view = UINavigationController(rootViewController: rootVC)
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true)
        
    }
    
    
    
    @objc func showReadyTasks(sender:UIButton) {
        sender.backgroundColor = .white
        inProgressButton.backgroundColor = nil
        isReady = true
        readyTasks = taskInfo.filter({$0.status == true})
        
        tasksTableView.reloadData()
 
 
    }
    
    @objc func showInProgressTasks(sender:UIButton){
        sender.backgroundColor = .white
        readyButton.backgroundColor = nil
        isReady = false
        inProgressTasks = taskInfo.filter({$0.status == false})
        tasksTableView.reloadData()
     }
    
    private lazy var readyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ready", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 6.93
        button.addTarget(self, action: #selector(showReadyTasks), for: .touchUpInside)
 
        return button
    }()
    private lazy var bgButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        view.layer.cornerRadius = 9
        return view
    }()
    
    
    private lazy var inProgressButton: UIButton = {
        let button = UIButton()
        button.setTitle("In Progress", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 6.93
        button.addTarget(self, action: #selector(showInProgressTasks), for: .touchUpInside)
//        button.addTarget(self, action: #selector(showInProgressTasks(sender:)), for: .touchUpInside)
        return button
    }()
    private lazy var tasksTableView:UITableView = {
        let view = UITableView()
           return view
    }()
   
    private var addTaskButton:UIButton = {
        let view = UIButton()
        view.setTitle("ADD TASK", for: .normal)
        view.backgroundColor = UIColor.rgb(red: 251, green: 231, blue: 231)
        view.setTitleColor(UIColor.black, for: .normal)
        
        view.backgroundColor = .green
        view.addTarget(self, action: #selector(goToAddTaskViewController), for: .touchUpInside)
        return view
    }()
    
     
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.frame = view.bounds

        readyTasks = taskInfo.filter({$0.status == true})
        
        view.backgroundColor = .white
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        view.addSubview(tasksTableView)
        view.addSubview(addTaskButton)
        view.addSubview(bgButtonView)

        bgButtonView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(330)
        }
        
        
        bgButtonView.addSubview(readyButton)
        bgButtonView.addSubview(inProgressButton)
        
        inProgressButton.snp.makeConstraints{make in
            make.trailing.equalTo(bgButtonView).offset(-5)
            make.width.equalTo(155)
            make.centerY.equalTo(bgButtonView)
        }
        
        readyButton.snp.makeConstraints{make in
            make.leading.equalTo(bgButtonView).offset(5)
            make.centerY.equalTo(bgButtonView)
            make.width.equalTo(155)
            
        }
         
        
        
        
        tasksTableView.snp.makeConstraints{make in
            make.top.equalTo(bgButtonView).offset(100)
            make.width.equalTo(430)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(0)
            
        }
    addTaskButton.snp.makeConstraints{make in
        make.top.equalToSuperview().offset(700)
        make.width.equalTo(120)
        make.height.equalTo(40)
         make.centerX.equalToSuperview()
    }
        
 
        
    }


}

extension TasksTableViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isReady ? readyTasks.count : inProgressTasks.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ViewCell()
        let task = isReady ? readyTasks[indexPath.row] : inProgressTasks[indexPath.row]
        cell.titleLabel.text = task.title
        
         return cell
         
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bla = InformationViewController()
        let task = isReady ? readyTasks[indexPath.row] : inProgressTasks[indexPath.row]
        
        bla.setData(title: task.title, desc: task.description)
        navigationController?.pushViewController(bla, animated: true)

    }
    
    
}
 


 
extension UIColor {
static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
}
}

var taskInfo:[Model] = [
    Model(title: "Home work", description: "Need to finish my first example ", status: true),
    Model(title: "Walking", description: "Need to finish my second example ", status: true),
    Model(title: "Class work", description: "Need to finish my third example ", status: false),
    Model(title: "Home work", description: "Need to finish my fourth example ", status: false),
    Model(title: "Home work", description: "Need to finish my fifth example ", status: true),
    Model(title: "Home work", description: "Need to finish my sixth example ", status: true),


]


 
