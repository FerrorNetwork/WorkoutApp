//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Данил on 25.11.2022.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView: WABaseInfoView = {
        let view = WABaseInfoView(with: "Test", buttonTitle: "Test Button".uppercased())
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension SessionController {
    override func addViews() {
        super.addViews()
        
        view.addView(timerView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    override func configure() {
        super.configure()
        title = "High Intensity Cardio"
        
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
    }
}
