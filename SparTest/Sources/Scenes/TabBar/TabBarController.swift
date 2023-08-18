//
//  TabBarController.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    enum TabBarItem: Int {
        case main
        case catalog
        case cart
        case profile

        var title: String {
            switch self {
            case .main: return "Главная"
            case .catalog: return "Каталог"
            case .cart: return "Корзина"
            case .profile: return "Профиль"
            }
        }

        var imageName: String {
            switch self {
            case .main: return "hexagon"
            case .catalog: return "square.grid.2x2"
            case .cart: return "cart"
            case .profile: return "person"
            }
        }

        var selectedImageName: String {
            switch self {
            case .main: return "hexagon.fill"
            case .catalog: return "square.grid.2x2.fill"
            case .cart: return "cart.fill"
            case .profile: return "person.fill"
            }
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarAppearance()
    }

    // MARK: - Private functions

    private func setupTabBar() {
        let tabBarItems: [TabBarItem] = [.main, .catalog, .cart, .profile]

        viewControllers = tabBarItems.map {
            switch $0 {
            case .main:
                let viewController = MainModuleConfigurator().configure()
                return wrappedInNavigationController(with: viewController)
            case .catalog:
                let viewController = createBlankViewController()
                return wrappedInNavigationController(with: viewController)
            case .cart:
                let viewController = createBlankViewController()
                return wrappedInNavigationController(with: viewController)
            case .profile:
                let viewController = createBlankViewController()
                return wrappedInNavigationController(with: viewController)
            }
        }

        viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = tabBarItems[$0].title
            $1.tabBarItem.image = UIImage(systemName: tabBarItems[$0].imageName)
            $1.tabBarItem.selectedImage = UIImage(systemName: tabBarItems[$0].selectedImageName)
        }
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

private extension TabBarController {
    func wrappedInNavigationController(with viewController: UIViewController) -> UINavigationController {
        UINavigationController(rootViewController: viewController)
    }

    func createBlankViewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = Colors.white.color
        return viewController
    }
}
