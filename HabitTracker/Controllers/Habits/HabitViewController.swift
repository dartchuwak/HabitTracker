//
//  HabitViewController.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 11.12.2022.
//

import UIKit

class HabitViewController: UIViewController, UICollectionViewDelegate {
    
    var id = 99
    
    let picker = ColorPickerViewController()
    
    var timePicker: UIDatePicker = {
        var picker = UIDatePicker(frame: .zero)
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    let taskTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete", for: .normal)
        button.tintColor = .systemRed
        button.isHidden = true
        return button
    }()
    
    let colorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let colorButtom: UIButton = {
        let image = UIImage(systemName: "circle.fill")
        let button = UIButton(frame: .zero)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .lightGray
        button.clipsToBounds = true
        return button
    }()
    
    let taskTitleTextFiled: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder =  "Enter your text here..."
        return tf
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Time"
        return label
    }()
    
    var timeSelectedLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Every day at 11:00"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        //self.navigationItem.title = "Create"
        let createBarButton = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(createTask))
        let closeBarButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeView))
        closeBarButton.tintColor = UIColor(named: "indigo")
        createBarButton.tintColor = UIColor(named: "indigo")
        self.navigationItem.setRightBarButton(createBarButton, animated: true)
        self.navigationItem.setLeftBarButton(closeBarButton, animated: true)
        colorButtom.addTarget(self, action: #selector(openColorView), for: .touchUpInside)
        taskTitleTextFiled.delegate = self
        picker.delegate = self
        picker.selectedColor = self.colorButtom.tintColor
        timePicker.addTarget(self, action: #selector(timePicked), for: .valueChanged)
        deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        addViews()
        layoutViews()
        currentDate()
    }
    
    private func addViews(){
        view.addSubview(taskTitle)
        view.addSubview(taskTitleTextFiled)
        view.addSubview(colorLabel)
        view.addSubview(colorButtom)
        view.addSubview(timeLabel)
        view.addSubview(timeSelectedLabel)
        view.addSubview(timePicker)
        view.addSubview(deleteButton)
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            taskTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            taskTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            taskTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            taskTitle.heightAnchor.constraint(equalToConstant: 18),
            taskTitleTextFiled.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 46),
            taskTitleTextFiled.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            taskTitleTextFiled.heightAnchor.constraint(equalToConstant: 22),
            taskTitleTextFiled.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -65),
            colorLabel.topAnchor.constraint(equalTo: taskTitleTextFiled.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            colorButtom.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7),
            colorButtom.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            colorButtom.widthAnchor.constraint(equalToConstant: 30),
            colorButtom.heightAnchor.constraint(equalToConstant: 30),
            timeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 153),
            timeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            timeSelectedLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 178),
            timeSelectedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            timePicker.topAnchor.constraint(equalTo: timeSelectedLabel.bottomAnchor, constant: 15),
            timePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            timePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            deleteButton.widthAnchor.constraint(equalToConstant: 147),
        ])
    }
    
    private func currentDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        timeSelectedLabel.text = "Every day at \(dateFormatter.string(from: timePicker.date))"
    }
    
    @objc private func openColorView() {
        
        self.present(picker, animated: true)
    }
    
    @objc private func timePicked() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        timeSelectedLabel.text = "Every day at \(dateFormatter.string(from: timePicker.date))"
    }
    
    @objc private func closeView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func createTask() {
        guard let text = taskTitleTextFiled.text else { return }
        let color = colorButtom.tintColor ?? UIColor.orange
        let date = timePicker.date
        let newHabit = Habit(name: text,
                             date: date,
                             color: color)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @objc private func deleteTask() {
        HabitsStore.shared.habits.remove(at: id)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    //  Called once you have finished picking the color.
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.colorButtom.tintColor = viewController.selectedColor
    }
    
    //  Called on every color selection done in the picker.
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.colorButtom.tintColor = viewController.selectedColor
    }
}


extension HabitViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
}


