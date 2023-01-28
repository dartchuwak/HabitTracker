//
//  HabitsViewController.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 09.12.2022.
//

import UIKit

protocol CellDelegateProtocol {
    func reloadData()
}

class HabitsViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        return cv
    }()
    
    let cellId = "id"
    let progressCellId = "CellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = false
        let add = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(open))
        self.navigationItem.setRightBarButton(add, animated: true)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "indigo")
        self.tabBarController?.tabBar.tintColor = UIColor(named: "indigo")
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: progressCellId)
        addViews()
        layoutViews()
    }
    
    
    private func addViews() {
        view.addSubview(collectionView)
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    @objc private func open() {
        self.navigationController?.pushViewController(HabitViewController(), animated: true)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
}


extension HabitsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, CellDelegateProtocol {
    
    func reloadData() {
        self.collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.bounds.width - 32, height: 60)
        } else {
            return CGSize(width: view.bounds.width - 32, height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 0, right: 10.0)
        } else {
            return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 5, right: 10.0)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return HabitsStore.shared.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: progressCellId, for: indexPath) as! ProgressCollectionViewCell
            cell.progressBar.progress = HabitsStore.shared.todayProgress
            cell.progressLabel.text = "\(Int(HabitsStore.shared.todayProgress * 100)) %"
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HabitCollectionViewCell
            let habit = HabitsStore.shared.habits[indexPath.item]
            cell.taskTitleLabel.text = habit.name
            cell.taskTitleLabel.textColor = habit.color
            cell.timeTextLabel.text = habit.dateString
            cell.id = indexPath.row
            cell.cellDelegate = self
            if HabitsStore.shared.habits[indexPath.item].isAlreadyTakenToday {
                cell.circle.image = UIImage(named: "Subtract")?.withRenderingMode(.alwaysTemplate)
            } else {
               cell.circle.image = UIImage(named: "Oval")?.withRenderingMode(.alwaysTemplate)
            }
            cell.circle.tintColor = habit.color
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let habit = HabitsStore.shared.habits[indexPath.item]
            let habbitVC = HabitDetailsViewController()
            habbitVC.title = habit.name
            habbitVC.id = indexPath.row
            habbitVC.navigationItem.title = habit.name
         
            navigationController?.pushViewController(habbitVC, animated: true)
            let save = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(createTask))
            habbitVC.navigationItem.setRightBarButton(save, animated: true)
        }
    }
    
    @objc func createTask() {
        print("f")
    }
}
