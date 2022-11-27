//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Данил on 25.11.2022.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

final class WAButton: UIButton {
    
    private var type: WAButtonType = .primary
    
    private let lable = UILabel()
    private let iconView = UIImageView()
    
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type

        
        addViews()
        layoutViews()
        configure()
    }
    
 
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        addViews()
        layoutViews()
        configure()
    }
    
    func setTitle(_ title: String?) {
        lable.text = title
    }
}

private extension WAButton {
    
    func addViews() {
        addView(lable)
        addView(iconView)
    }
    
    func layoutViews() {
        var horizontalOffset: CGFloat {
            switch type {
            case .primary:
                return 0
            case .secondary:
                return 10
            }
        }
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset * 2)
        ])
    }
    
    func configure() {
        switch type {
        case .primary:
            lable.textColor = Resources.Colors.inactive
            iconView.tintColor = Resources.Colors.inactive
            lable.font = Resources.Fonts.helvericareRegular(with: 13)
        case .secondary:
            backgroundColor = Resources.Colors.secondary
            layer.cornerRadius = 14
            lable.textColor = Resources.Colors.active
            iconView.tintColor = Resources.Colors.active
            lable.font = Resources.Fonts.helvericareRegular(with: 15)
        }
        
        makeSystem(self)
        lable.textAlignment = .center
        iconView.image = Resources.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        
    }
}
