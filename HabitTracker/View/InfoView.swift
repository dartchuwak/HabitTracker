//
//  InfoView.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 11.12.2022.
//

import UIKit


class InfoView: UIView {
    
    let headTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Привычка за 21 день"
      //label.backgroundColor = .gray
        return label
    }()
    
    
    let bodyTextLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
    label.text = textData
        //label.backgroundColor = .gray
    return label
}()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubiews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubiews() {
        self.addSubview(headTextLabel)
        self.addSubview(bodyTextLabel)
        
    }
    
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
        headTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
        headTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
        headTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-16),
        //headTextLabel.heightAnchor.constraint(equalToConstant: 50),
        bodyTextLabel.topAnchor.constraint(equalTo: headTextLabel.bottomAnchor, constant: 22),
        bodyTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
        bodyTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-16),
        bodyTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0)
        ])
    }
}
