//
//  HabitDetailsTableViewCell.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 13.12.2022.
//

import UIKit

class HabitDetailsTableViewCell: UITableViewCell {
    
    //let id = Int()
    //var date = Date()
    
    
    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    
    let checkMark: UIImageView = {
        let mark = UIImage(systemName: "checkmark")
        let image = UIImageView(frame: .zero)
        image.image = mark
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    
        addSubview(label)
        addSubview(checkMark)
      
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor,constant: 11),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            checkMark.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            checkMark.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
