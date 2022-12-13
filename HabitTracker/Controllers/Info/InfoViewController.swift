//
//  ViewController.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 09.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    let contentView = InfoView()
    
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.translatesAutoresizingMaskIntoConstraints = false
      //  sv.backgroundColor = .orange
        return sv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        addSubiews()
        layoutViews()
    }
    
    
    private func addSubiews() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor ,constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            //contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            //contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
           // contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
        ])
    }
}

