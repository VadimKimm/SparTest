//
//  MainCollectionViewAdapter.swift
//  SparTest
//
//  Created by Vadim Kim on 15.08.2023.
//

import UIKit

final class MainCollectionViewAdapter: NSObject {

    // MARK: - Properties

    private var collectionView: UICollectionView
    private var dataSource: [MainSectionType: Any] = [:]

    // MARK: - Initialization

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        setupCollection()
    }

    // MARK: - Configuration

    func configure(with dataSource: [MainSectionType: Any]) {
        self.dataSource = dataSource
        collectionView.reloadData()
    }

    // MARK: - Private methods

    private func setupCollection() {
        collectionView.dataSource = self

        collectionView.register(
            StoryCollectionViewCell.self,
            forCellWithReuseIdentifier: StoryCollectionViewCell.identifier
        )
        collectionView.register(
            PromotionCollectionViewCell.self,
            forCellWithReuseIdentifier: PromotionCollectionViewCell.identifier
        )
        collectionView.register(
            BonusCollectionViewCell.self,
            forCellWithReuseIdentifier: BonusCollectionViewCell.identifier
        )
        collectionView.register(
            MixedCollectionViewCell.self,
            forCellWithReuseIdentifier: MixedCollectionViewCell.identifier
        )
        collectionView.register(
            ProductCollectionViewCell.self,
            forCellWithReuseIdentifier: ProductCollectionViewCell.identifier
        )
        collectionView.register(
            HeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionReusableView.identifier
        )
    }
}

// MARK: - UICollectionViewDataSource

extension MainCollectionViewAdapter: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        MainSectionType.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch  MainSectionType.allCases[section] {
        case .stories:
            guard let dataSourse = dataSource[.stories] as? [StoryModel] else { return 0 }
            return dataSourse.count
        case .mixed:
            guard let dataSourse = dataSource[.mixed] as? [MixModel] else { return 0 }
            return dataSourse.count
        case .bonus: return 1
        case .promotions, .recommendations, .sweetMood: return 100
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch MainSectionType.allCases[indexPath.section] {
        case .stories:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StoryCollectionViewCell.identifier,
                for: indexPath
            ) as? StoryCollectionViewCell,
                  let dataSourse = dataSource[.stories] as? [StoryModel]
            else { return UICollectionViewCell() }
            cell.configure(with: dataSourse[indexPath.row])
            return cell
        case .promotions:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PromotionCollectionViewCell.identifier,
                for: indexPath
            ) as? PromotionCollectionViewCell,
                  let dataSourse = dataSource[.promotions] as? [PromotionModel]
            else { return UICollectionViewCell() }
            cell.configure(with: dataSourse[indexPath.row % dataSourse.count])
            return cell
        case .bonus:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BonusCollectionViewCell.identifier,
                for: indexPath
            ) as? BonusCollectionViewCell,
                  let dataSourse = dataSource[.bonus] as? [BonusModel]
            else { return UICollectionViewCell() }
            cell.configure(with: dataSourse[indexPath.row])
            return cell
        case .mixed:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MixedCollectionViewCell.identifier,
                for: indexPath
            ) as? MixedCollectionViewCell,
                  let dataSourse = dataSource[.mixed] as? [MixModel]
            else { return UICollectionViewCell() }
            cell.configure(with: dataSourse[indexPath.row])
            return cell
        case .recommendations:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCollectionViewCell.identifier,
                for: indexPath
            ) as? ProductCollectionViewCell,
                  let dataSourse = dataSource[.recommendations] as? [ProductModel]
            else { return UICollectionViewCell() }
            cell.configure(with: dataSourse[indexPath.row % dataSourse.count])
            return cell
        case .sweetMood:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCollectionViewCell.identifier,
                for: indexPath
            ) as? ProductCollectionViewCell,
                  let dataSourse = dataSource[.sweetMood] as? [ProductModel]
            else { return UICollectionViewCell() }
            cell.configure(with: dataSourse[indexPath.row % dataSourse.count])
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch MainSectionType.allCases[indexPath.section] {
        case .recommendations:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderCollectionReusableView.identifier,
                for: indexPath
            ) as? HeaderCollectionReusableView else { return UICollectionReusableView() }
            header.configure(with: MainSectionType.recommendations.title)
            return header
        case .sweetMood:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderCollectionReusableView.identifier,
                for: indexPath
            ) as? HeaderCollectionReusableView else { return UICollectionReusableView() }
            header.configure(with: MainSectionType.sweetMood.title)
            return header
        default: return UICollectionReusableView()
        }
    }
}
