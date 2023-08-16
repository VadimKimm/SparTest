//
//  MainView.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

final class MainView: UIView {

    // MARK: - Views

    private let navigationBar = CustomNavigationBar()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: LayoutHandler.createMainLayout()
        )
        return collectionView
    }()

    // MARK: - Settings

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }

    // MARK: - Private functions

    private func setupHierarchy() {
        addSubview(navigationBar)
        addSubview(collectionView)
    }

    private func setupLayout() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.navigationBarTopOffset),
            navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: Metrics.collectionViewTopOffset),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupView() {
        backgroundColor = Colors.white.color
//        collectionView.backgroundColor = .red
    }
}

// MARK: - Metrics

extension MainView {
    enum Metrics {
        static let navigationBarTopOffset: CGFloat = 55
        static let collectionViewTopOffset: CGFloat = 5
    }
}
