//
//  ProgressCollectionViewCell.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 11.12.2022.
//

import UIKit



class ProgressCollectionViewCell: UICollectionViewCell {
    
    
    let progressBar: UIProgressView = {
        let pr = UIProgressView(frame: .zero)
        pr.trackTintColor = .gray
        pr.progressTintColor = .orange
        var prog = HabitsStore.shared.todayProgress
        pr.progress = prog
        pr.translatesAutoresizingMaskIntoConstraints = false
        pr.progressViewStyle = .bar
        return pr
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Все получитья!"
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressLabel: UILabel = {
        let label = UILabel(frame: .zero)
        var persent = String()
        label.text = "\(persent) %"
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.backgroundColor = .white
        addSubview(progressBar)
        addSubview(label)
        addSubview(progressLabel)
        
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.heightAnchor.constraint(equalToConstant: 18),
            progressLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            progressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            progressBar.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            progressBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            progressBar.heightAnchor.constraint(equalToConstant: 7),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
