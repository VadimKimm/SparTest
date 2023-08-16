//
//  MixedCollectionViewCell.swift
//  SparTest
//
//  Created by Vadim Kim on 16.08.2023.
//

import UIKit

final class MixedCollectionViewCell: BaseCollectionViewCell {

    // MARK: - Configuration

    func configure(with model: BonusModel) {
        let value = model.value
        let bonusText = getBonusString(of: value)
        let text = "\(value) \(bonusText)"
        let attributedString = NSMutableAttributedString(string: text)
        let rangeOfSecondPart = (text as NSString).range(of: bonusText)
        let fontForSecondPart = UIFont.systemFont(ofSize: 18, weight: .bold)
        attributedString.addAttribute(NSAttributedString.Key.font, value: fontForSecondPart, range: rangeOfSecondPart)

        imageView.image = UIImage(named: model.image)
        titleLabel.attributedText = attributedString
    }

    //MARK: - Properties

    static let identifier = String(describing: MixedCollectionViewCell.self)

    // MARK: - Views

    private var titleLabel = UILabel()

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
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.titleLabelLeftOffset)
        ])
    }

    override func setupView() {
        imageView.layer.cornerRadius = Metrics.cornerRadius

        titleLabel.font = .systemFont(ofSize: 35, weight: .bold)
        titleLabel.textColor = Colors.black.color
    }
}


private extension MixedCollectionViewCell {
    func getBonusString(of value: Int) -> String {
        switch value % 10 {
        case 1: return "бонус"
        case 2...4: return "бонуса"
        default: return "бонусов"
        }
    }
}

// MARK: - Metrics

private extension MixedCollectionViewCell {
    enum Metrics {
        static let cornerRadius: CGFloat = 15
        static let titleLabelLeftOffset: CGFloat = 15
    }
}

