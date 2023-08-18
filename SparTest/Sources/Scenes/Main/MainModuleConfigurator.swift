//
//  MainModuleConfigurator.swift
//  SparTest
//
//  Created by Vadim Kim on 18.08.2023.
//

import UIKit

final class MainModuleConfigurator {

    func configure() -> MainViewController {
        let view = MainViewController()
        let presenter = ProfilePresenter(view: view)
        view.output = presenter
        return view
    }
}
