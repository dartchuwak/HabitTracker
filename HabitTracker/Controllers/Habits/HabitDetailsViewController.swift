//
//  HabitDetailsViewController.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 13.12.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    var id = Int()
    
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.allowsSelection = false
        return tv
    }()
    
    let cellId = "id"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = false
        addEditButton()
        view.addSubview(tableView)
        tableView.register(HabitDetailsTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    
    private func addEditButton() {
        let createBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector (editHabit))
        self.navigationItem.setRightBarButton(createBarButton, animated: true)
    }
    
   @objc private func editHabit() {
       let vc = HabitViewController()
       vc.id = id
       let habit = HabitsStore.shared.habits[id]
       vc.deleteButton.isHidden = false
       vc.colorButtom.tintColor = habit.color
       vc.taskTitleTextFiled.text = habit.name
       vc.navigationItem.title = habit.name
       self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HabitDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HabitDetailsTableViewCell
        let habitDate = HabitsStore.shared.dates[indexPath.item]
        let habit = HabitsStore.shared.habits[id]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        cell.label.text = dateFormatter.string(from: habitDate)
        if HabitsStore.shared.habit(habit, isTrackedIn: habitDate) {
            cell.checkMark.isHidden = false
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Activity"
    }
}
