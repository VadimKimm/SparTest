//
//  Colors.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

enum Colors {
    case gray
    case green
    case darkGray
    case white
    case black

    var color: UIColor {
        switch self {
        case .gray: return UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        case .green: return UIColor(red: 0.28, green: 0.8, blue: 0.26, alpha: 1)
        case.darkGray: return UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        case .white: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        case .black: return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }

    var cgColor: CGColor {
        return self.color.cgColor
    }
}
