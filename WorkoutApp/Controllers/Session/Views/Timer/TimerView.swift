//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Данил on 28.11.2022.
//

import UIKit

enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {
    
    private let elapsedTimeLable: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.elapsedTime
        label.font = Resources.Fonts.helvericareRegular(with: 14)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimeValueLable: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvericareRegular(with: 46)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLable: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.remainengTime
        label.font = Resources.Fonts.helvericareRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeValueLable: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvericareRegular(with: 13)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let timeStackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
         view.distribution = .fillProportionally
         view.spacing = 25
         return view
     }()
    
    private let completedPercentView = TimerPercentView()
    private let remainigPercentView = TimerPercentView()
    
    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    var state: TimerState = .isStopped
    var callback: ((CGFloat) -> Void)?
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        let roundedPercent = Int(round(percent * 100))
        
        elapsedTimeValueLable.text = getDisplaedString(from: Int(tempCurrentValue))
        remainingTimeValueLable.text = getDisplaedString(from: Int(duration) - Int(tempCurrentValue))
        completedPercentView.configure(with: roundedPercent, title: Resources.Strings.Session.completedPercent.uppercased())
        remainigPercentView.configure(with: 100 - roundedPercent, title: Resources.Strings.Session.remainingPercent.uppercased())
        
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer() {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                self.callback?(self.timerProgress)
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= self.timerDuration * 0.03
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    override func addViews() {
        super.addViews()
        
        addView(progressView)
        addView(timeStackView)
        addView(bottomStackView)
        
        [
            elapsedTimeLable,
            elapsedTimeValueLable,
            remainingTimeLable,
            remainingTimeValueLable
        ].forEach {
            timeStackView.addArrangedSubview($0)
        }
        
        [
            completedPercentView,
            bottomSeparatorView,
            remainigPercentView
        ].forEach {
            bottomStackView.addArrangedSubview($0)
        }
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeparatorView.widthAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}

private extension TimerView {
    func getDisplaedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minuteStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0
        ? [minuteStr, secondStr].joined(separator: ":")
        : [hoursStr, minuteStr, secondStr].joined(separator: ":")
        
    }
}
