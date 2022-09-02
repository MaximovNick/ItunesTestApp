//
//  UIStackView + Extension.swift
//  ItunesApp
//
//  Created by Nikolai Maksimov on 02.09.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView] , axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution) {
        
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
