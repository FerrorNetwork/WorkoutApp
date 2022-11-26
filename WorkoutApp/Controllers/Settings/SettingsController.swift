//
//  SettingsController.swift
//  WorkoutApp
//
//  Created by Данил on 25.11.2022.
//


import UIKit

class SettingsController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Settings"
        
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.settings
    }


}

