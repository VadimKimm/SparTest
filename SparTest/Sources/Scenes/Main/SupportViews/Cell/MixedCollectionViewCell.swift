//
//  MixedCollectionViewCell.swift
//  SparTest
//
//  Created by Vadim Kim on 16.08.2023.
//

import UIKit

final class MixedCollectionViewCell: BaseCollectionViewCell {

    // MARK: - Configuration

    func configure(with model: MixModel) {
        imageView.image = UIImage(named: model.image)
        titleLabel.text = model.title
    }

    //MARK: - Properties

    static let identifier = String(describing: MixedCollectionViewCell.self)

    // MARK: - Views

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()


    // MARK: - Settings

    override func setupHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
    }

    override func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.titleLabelTopOffset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.titleLabelSideOffset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.titleLabelSideOffset)
        ])
    }

    override func setupView() {
        imageView.layer.cornerRadius = Metrics.cornerRadius

        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = Colors.black.color
    }
}

// MARK: - Metrics

private extension MixedCollectionViewCell {
    enum Metrics {
        static let cornerRadius: CGFloat = 15
        static let titleLabelTopOffset: CGFloat = 10
        static let titleLabelSideOffset: CGFloat = 5
    }
}
