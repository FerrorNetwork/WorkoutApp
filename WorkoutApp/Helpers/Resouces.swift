//
//  Resouces.swift
//  WorkoutApp
//
//  Created by Данил on 23.11.2022.
//

import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor(hexString: "#437BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        
        static var background = UIColor(hexString: "#F8F9F9")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var titleGray = UIColor(hexString: "#545C77")
        
        static var secondary = UIColor(hexString: "#F0F3FF")
    }
    
    enum Strings {
        enum TabBar {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
        
        enum Session {
            static let navBarStart = "Start"
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
            
            static let elapsedTime = "Elapsed Time"
            static let remainengTime = "Remaining Time"
            
            static let completedPercent = "completed"
            static let remainingPercent = "remaining"
        }
        
    }
    
    enum Images {
        enum TabBar {
            static var overview = UIImage(named: "overview_tab")
            static var session = UIImage(named: "session_tab")
            static var progress = UIImage(named: "progress_tab")
            static var settings = UIImage(named: "settings_tab")
        }
        
        enum Common {
            static var downArrow = UIImage(named: "down_arrow")
            static var addButton = UIImage(named: "add_button")
        }
    }
    
    enum Fonts {
        static func helvericareRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    enum Overview {
        static var allWorkoutsButton = "All Workouts"
        static var title = "Today"
        
    }
}
