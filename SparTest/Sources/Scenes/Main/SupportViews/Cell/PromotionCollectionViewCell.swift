//
//  PromotionCollectionViewCell.swift
//  SparTest
//
//  Created by Vadim Kim on 16.08.2023.
//

import UIKit

final class PromotionCollectionViewCell: BaseCollectionViewCell {

    // MARK: - Configuration

    func configure(with model: PromotionModel) {
        imageView.image = UIImage(named: model.image)
    }

    func configure(with model: BonusModel) {
        imageView.image = UIImage(named: model.image)
    }

    //MARK: - Properties

    static let identifier = String(describing: PromotionCollectionViewCell.self)

    // MARK: - Views

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - Settings

    override func setupHierarchy() {
        addSubview(imageView)
    }

    override func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    override func setupView() {
        imageView.layer.cornerRadius = Metrics.cornerRadius
    }
}

// MARK: - Metrics

private extension PromotionCollectionViewCell {
    enum Metrics {
        static let cornerRadius: CGFloat = 15
    }
}

