import UIKit

class ReadyTableViewController: UIViewController {
    
    @objc func configureNavbar() {
        dismiss(animated: true, completion: nil)
        
    }
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(configureNavbar))
        
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        button.backgroundColor = .black
        return button
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(backButton)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 120))
        
    }
}

extension ReadyTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if tasks[indexPath.row].status == true{
            cell.textLabel?.text = tasks[indexPath.row].title
        }
        
        return cell
    }
}
