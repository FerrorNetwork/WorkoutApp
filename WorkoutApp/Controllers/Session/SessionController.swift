//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Данил on 25.11.2022.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView = TimerView()
    
    private let timerDuration = 3.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        addNavBarButton(at: .left, with: timerView.state == .isRuning ? Resources.Strings.Session.navBarPause : Resources.Strings.Session.navBarStart)
    }

    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        addNavBarButton(at: .left, with: Resources.Strings.Session.navBarStart)
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
            //timerView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
    }
    
    override func configure() {
        super.configure()
        title = "High Intensity Cardio"
        
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: Resources.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: Resources.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        
        timerView.callback = { [weak self] progress in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.navBarRightButtonHandler()
                print(progress)
            }
        }
    }
}
