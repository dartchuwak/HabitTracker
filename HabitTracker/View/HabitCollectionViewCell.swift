//
//  HabitCell.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 11.12.2022.
//

import UIKit



class HabitCollectionViewCell: UICollectionViewCell {
    
    var cellDelegate: CellDelegateProtocol?
    
    var id = Int()
    
    let taskTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.tintColor = .systemBlue
        label.textColor = .systemBlue
        label.text = "Test data"
        label.numberOfLines = 2
        return label
    }()
    
    
    
    let circle: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.tintColor = .orange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    let timeTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    let countLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .lightGray
        label.text = "Count"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.backgroundColor = .white

        addViews()
        layoutViews()
        addGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        circle.addGestureRecognizer(tap)
    }
    
    
    private func addViews() {
        addSubview(taskTitleLabel)
        addSubview(timeTextLabel)
        addSubview(countLabel)
        addSubview(circle)
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            taskTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            taskTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            taskTitleLabel.widthAnchor.constraint(equalToConstant: 220),
            timeTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            timeTextLabel.heightAnchor.constraint(equalToConstant: 16),
            timeTextLabel.topAnchor.constraint(equalTo: taskTitleLabel.bottomAnchor, constant: 4),
            timeTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            countLabel.topAnchor.constraint(equalTo: timeTextLabel.bottomAnchor, constant: 30),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            countLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            circle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            circle.topAnchor.constraint(equalTo: topAnchor, constant: 47),
            circle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -47),
            circle.widthAnchor.constraint(equalToConstant: 36),
            circle.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    @objc private func onTap() {
        if HabitsStore.shared.habits[id].isAlreadyTakenToday != true {
            let habit = HabitsStore.shared.habits[id]
            circle.image = UIImage(systemName: "circle.fill")
            HabitsStore.shared.track(habit)
            cellDelegate?.reloadData()
        } else { return }
    }
    
}
