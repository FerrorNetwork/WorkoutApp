//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Данил on 23.11.2022.
//

import UIKit

class OverviewViewController: BaseController {
    
    private let navBar = OverviewNavBar()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension OverviewViewController {
    override func addViews() {
        super.addViews()
        
        view.addSubview(navBar)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
    override func configure() {
        super.configure()
        
        navigationController?.navigationBar.isHidden = true
        navBar.translatesAutoresizingMaskIntoConstraints = false

    }
}


