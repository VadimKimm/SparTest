//
//  StoryCollectionViewCell.swift
//  SparTest
//
//  Created by Vadim Kim on 15.08.2023.
//

import UIKit

final class StoryCollectionViewCell: BaseCollectionViewCell {

    // MARK: - Configuration

    func configure(with model: StoryModel) {
        titleLabel.text = model.title
        imageView.image = UIImage(named: model.image)
    }

    //MARK: - Properties

    static let identifier = String(describing: StoryCollectionViewCell.self)

    // MARK: - Views

    private var circleView = UIView()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()

    // MARK: - Settings

    override func setupHierarchy() {
        addSubview(circleView)
        addSubview(titleLabel)

        circleView.addSubview(imageView)
    }

    override func setupLayout() {
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.widthAnchor.constraint(equalTo: widthAnchor, constant: Metrics.circleViewHeightOffset),
            circleView.heightAnchor.constraint(equalTo: widthAnchor, constant: Metrics.circleViewHeightOffset),
        ])

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: circleView.heightAnchor, constant: Metrics.imageViewHeightOffset),
            imageView.widthAnchor.constraint(equalTo: circleView.heightAnchor, constant: Metrics.imageViewHeightOffset)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: Metrics.titleLabelTopOffset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func setupView() {
        circleView.backgroundColor = .white
        circleView.layer.borderWidth = 2
        circleView.layer.borderColor = Colors.green.cgColor
        circleView.layer.cornerRadius = (frame.width + Metrics.circleViewHeightOffset) / 2

        imageView.layer.cornerRadius = circleView.layer.cornerRadius + Metrics.imageViewHeightOffset

        titleLabel.font = .systemFont(ofSize: 12, weight: .light)
        titleLabel.textColor = Colors.black.color
    }
}

// MARK: - Metrics

private extension StoryCollectionViewCell {
    enum Metrics {
        static let circleViewHeightOffset: CGFloat = -25
        static let imageViewHeightOffset: CGFloat = -2
        static let titleLabelTopOffset: CGFloat = 5
    }
}
