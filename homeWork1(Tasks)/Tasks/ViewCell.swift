//
//  ViewCell.swift
//  lesson3
//
//  Created by Умар on 13/5/22.
//

import Foundation
import UIKit
import SnapKit
class ViewCell:UITableViewCell{

     var titleLabel:UILabel = {
        let view = UILabel()
        view.textColor = .black

        return view
    }()


    override func layoutSubviews() {

        addSubview(titleLabel)

        titleLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(40)

        }

}
}
