//
//  InformationViewController.swift
//  lesson3
//
//  Created by Умар on 18/5/22.
//

import UIKit
import SnapKit

class InformationViewController: UIViewController {
    
    
    var titleView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .gray
        view.text = "\(taskInfo[0].title)"
         view.textColor = .white

        return view
        
     }()


    var titleView2: UITextView = {
        let view = UITextView()
        view.backgroundColor = .gray
        view.text = "\(taskInfo[0].description)"
        view.textColor = .white
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleView2)
        view.addSubview(titleView)
        titleView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(140)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-150)
            make.height.equalTo(40)
        }
        titleView2.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(220)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(500)
        }
        
        
        
    }
    
    func setData(title: String, desc: String) {
        titleView.text = title
        titleView2.text = desc
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
