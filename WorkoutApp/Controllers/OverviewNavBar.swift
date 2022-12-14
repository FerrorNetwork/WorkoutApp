//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Данил on 26.11.2022.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let titleLable = UILabel()
    private let allWorkoutsButton: WAButton = {
        let button =  WAButton(with: .secondary)
        button.setTitle(Resources.Overview.allWorkoutsButton)
        return button
    }()
    private let addButton = UIButton()
    private let weekView = WeekView()
    
    
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addAdditingAction(_ action: Selector, with tagret: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension OverviewNavBar {
    override func addViews() {
        super.addViews()
        
        addView(titleLable)
        addView(addButton)
        addView(allWorkoutsButton)
        addView(weekView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            
            titleLable.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLable.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        backgroundColor = .white
        
        titleLable.text = Resources.Overview.title
        titleLable.textColor = Resources.Colors.titleGray
        titleLable.font = Resources.Fonts.helvericareRegular(with: 22)
       
        addButton.setImage(Resources.Images.Common.addButton, for: .normal)
    }
}
