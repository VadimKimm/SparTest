//
//  UIViewController+Ext.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

extension UIViewController {
    func setupTabBar(title: String, imageName: String, selectedImageName: String, tag: Int) {
        tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            tag: tag
        )
        tabBarItem.selectedImage = UIImage(systemName: selectedImageName)
        view.backgroundColor = .white
    }
}
