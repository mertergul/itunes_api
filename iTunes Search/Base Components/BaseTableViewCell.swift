//
//  BaseTableViewCell.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addMajorViews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViews()
        setupView()
    }
    
    func addMajorViews() {}
    func setupView() {}
    
    // Each cell must have an identifier
    static var identifier: String {
        return String(describing: self)
    }
}
