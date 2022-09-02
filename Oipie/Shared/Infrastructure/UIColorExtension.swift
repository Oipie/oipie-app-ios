//
//  UIColorExtension.swift
//  Oipie
//
//  Created by Adrián García García on 30/8/22.
//

import UIKit

extension UIColor {
    class var themeViolet: UIColor {
        return UIColor(named: "Violet")!
    }

    class var themeGray: UIColor {
        return UIColor(named: "Gray")!
    }

    class var themeWhite: UIColor {
        return UIColor(named: "White")!
    }
}

enum FontFamily: String {
    case montserratSemiBold = "Montserrat-SemiBold"
    case montserratRegular = "Montserrat-Regular"
}

enum FontSize: CGFloat {
    case small = 10.0
    case intermediate = 13.0
    case medium = 16.0
}

enum IconName: String {
    case heartFill = "heart-fill"
    case timer
    case home = "home"
    case search = "search"
    case heart = "heart"
    case pageFlip = "page-flip"
    case profileCircled = "profile-circled"
}

extension UIImage {
    convenience init?(icon: IconName) {
        self.init(named: icon.rawValue)
    }
}
