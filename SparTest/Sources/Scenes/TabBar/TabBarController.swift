//
//  TabBarController.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Properties

    private var mainViewController: UIViewController?
    private var catalogViewController: UIViewController?
    private var cartViewController: UIViewController?
    private var profileViewController: UIViewController?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        setupViewControllers()

        let viewControllers = [
            mainViewController,
            catalogViewController,
            cartViewController,
            profileViewController
        ]

        setViewControllers(
            viewControllers.map { UINavigationController(rootViewController: $0 ?? UIViewController()) },
            animated: false
        )
    }

    private func setupView() {
        setupTabBarAppearance()
    }

    // MARK: - Private functions

    private func setupViewControllers() {
        mainViewController = MainViewController()
        mainViewController?.setupTabBar(
            title: "Главная",
            imageName: "hexagon",
            selectedImageName: "hexagon.fill",
            tag: 0
        )

        catalogViewController = UIViewController()
        catalogViewController?.setupTabBar(
            title: "Каталог",
            imageName: "square.grid.2x2",
            selectedImageName: "square.grid.2x2.fill",
            tag: 1
        )

        cartViewController = UIViewController()
        cartViewController?.setupTabBar(
            title: "Корзина",
            imageName: "cart",
            selectedImageName: "cart.fill",
            tag: 2
        )

        profileViewController = UIViewController()
        profileViewController?.setupTabBar(
            title: "Профиль",
            imageName: "person",
            selectedImageName: "person.fill",
            tag: 3
        )
    }

    private func setupTabBarAppearance() {
        tabBar.backgroundColor = Colors.gray.color
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = Colors.black.cgColor
        tabBar.layer.shadowOpacity = 0.2

        tabBar.tintColor = Colors.green.color
        tabBar.unselectedItemTintColor = Colors.darkGray.color
    }
}
