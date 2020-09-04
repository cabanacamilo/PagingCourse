//
//  DataViewController.swift
//  PagingCourse
//
//  Created by Camilo Cabana on 4/09/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    var index = 0
    var text = String()
    
    let controllerLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        controllerLabel.text = text
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .clear
        view.addSubview(controllerLabel)
        controllerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        controllerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
