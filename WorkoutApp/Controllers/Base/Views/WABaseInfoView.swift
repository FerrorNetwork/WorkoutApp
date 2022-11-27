//
//  BaseInfoView.swift
//  WorkoutApp
//
//  Created by Данил on 27.11.2022.
//

import UIKit

class WABaseInfoView: BaseView {
    
    private let titleLabel: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helvericareRegular(with: 13)
        lable.textColor = Resources.Colors.inactive
        return lable
    }()
    
    private let button =  WAButton(with: .primary)
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resources.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    init(with title: String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title?.uppercased()
        button.setTitle(buttonTitle)
        button.isHidden = buttonTitle == nil ? true : false
        titleLabel.textAlignment = buttonTitle == nil ?  .center : .left
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonTarget(target: Any? , action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

@objc extension WABaseInfoView {
     override func addViews() {
         super.addViews()
         
         addView(titleLabel)
         addView(button)
         addView(contentView)
     }
    
     override func layoutViews() {
         super.layoutViews()
         
         let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
         let contentTopOffset: CGFloat = titleLabel.text == nil ? 0 : 10
         
         NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 28),
            
            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentTopOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
         ])
     }
    
     override func configureViews() {
         super.configureViews()
         
         backgroundColor = .clear
     }
}
