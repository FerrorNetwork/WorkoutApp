//
//  TimerPercentView.swift
//  WorkoutApp
//
//  Created by Данил on 28.11.2022.
//

import UIKit

extension TimerView {
    final class TimerPercentView: BaseView {
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLable: UILabel = {
           let label = UILabel()
            label.font = Resources.Fonts.helvericareRegular(with: 23)
            label.textColor = Resources.Colors.titleGray
            label.textAlignment = .center
            return label
        }()
        
        private let subtitleLable: UILabel = {
           let label = UILabel()
            label.font = Resources.Fonts.helvericareRegular(with: 10)
            label.textColor = Resources.Colors.inactive
            label.textAlignment = .center
            return label
        }()
        
        override func addViews() {
            super.addViews()
            
            addView(stackView)
            stackView.addArrangedSubview(percentLable)
            stackView.addArrangedSubview(subtitleLable)
        }
        
        override func layoutViews() {
            super.layoutViews()
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
        
        func configure(with value: Int, title: String) {
            subtitleLable.text = title
            percentLable.text = "\(value)%"
        }
    }
}

