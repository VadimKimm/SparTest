//
//  CustomNavigationBar.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

final class CustomNavigationBar: UINavigationBar {

    // MARK: - Views

    private lazy var searchView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Metrics.searchViewCornerRadius
        view.layer.borderColor = Colors.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()

    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "mappin.and.ellipse")?
            .withTintColor(Colors.red.color, renderingMode: .alwaysOriginal)
        imageView.image = image
        return imageView
    }()

    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private lazy var menuButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "list.bullet")?
            .withTintColor(Colors.green.color, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()

    private var separatorLine = UIView()

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
        addSubview(searchView)
        addSubview(menuButton)
        addSubview(separatorLine)

        searchView.addSubview(locationImageView)
        searchView.addSubview(locationLabel)
    }

    private func setupLayout() {
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.defaultSideOffset),
            menuButton.heightAnchor.constraint(equalToConstant: Metrics.menuButtonHeight),
            menuButton.widthAnchor.constraint(equalTo: menuButton.heightAnchor)
        ])

        searchView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchView.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchView.heightAnchor.constraint(equalToConstant: Metrics.searchViewHeight),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.defaultSideOffset),
            searchView.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: -Metrics.searchViewSideOffset)
        ])

        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationImageView.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            locationImageView.leadingAnchor.constraint(
                equalTo: searchView.leadingAnchor,
                constant: Metrics.defaultSideOffset
            ),
            locationImageView.heightAnchor.constraint(equalToConstant: Metrics.locationImageViewHeight),
            locationImageView.widthAnchor.constraint(equalTo: locationImageView.heightAnchor)
        ])

        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(
                equalTo: locationImageView.trailingAnchor,
                constant: Metrics.defaultSideOffset
            ),
            locationLabel.trailingAnchor.constraint(
                equalTo: searchView.trailingAnchor,
                constant: -Metrics.defaultSideOffset
            )
        ])

        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: Metrics.separatorLineHeight),
        ])
    }

    private func setupView() {
        separatorLine.backgroundColor = Colors.gray.color

        locationLabel.font = .systemFont(ofSize: 14)
        locationLabel.textColor = Colors.black.color
        locationLabel.text = Strings.locationTitle
    }
}

// MARK: - Metrics

private extension CustomNavigationBar {
    enum Metrics {
        static let defaultSideOffset: CGFloat = 15
        static let searchViewHeight: CGFloat = 35
        static let searchViewSideOffset: CGFloat = 5
        static let searchViewCornerRadius: CGFloat = searchViewHeight / 2
        static let menuButtonHeight: CGFloat = 28
        static let locationImageViewHeight: CGFloat = 15
        static let separatorLineHeight: CGFloat = 1
    }

    enum Strings {
        static let locationTitle = "Москва, Москва и Московская область"
    }
}
