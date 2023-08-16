//
//  MainCollectionViewAdapter.swift
//  SparTest
//
//  Created by Vadim Kim on 15.08.2023.
//

import UIKit

final class MainCollectionViewAdapter: NSObject {

    public enum Sections: CaseIterable {
        case stories
        case promotions
        case bonus
//        case mixed
//        case recommendations
//        case sweetMood
    }

    // MARK: - Properties

    private var collectionView: UICollectionView

    // MARK: - Initialization

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        setupCollection()
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
    }
}

// MARK: - UICollectionViewDataSource

extension MainCollectionViewAdapter: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Sections.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch  Sections.allCases[section] {
        case .stories:
            return StoryModel.createMockData().count
        case .promotions:
            return 100
        case .bonus:
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch Sections.allCases[indexPath.section] {
        case .stories:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StoryCollectionViewCell.identifier,
                for: indexPath
            ) as? StoryCollectionViewCell else { return UICollectionViewCell() }
            let datasourse = StoryModel.createMockData()
            cell.configure(with: datasourse[indexPath.row])
            return cell
        case .promotions:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PromotionCollectionViewCell.identifier,
                for: indexPath
            ) as? PromotionCollectionViewCell else { return UICollectionViewCell() }
            let datasourse = PromotionModel.createMockData()
            cell.configure(with: datasourse[indexPath.row % datasourse.count])
            return cell
        case .bonus:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BonusCollectionViewCell.identifier,
                for: indexPath
            ) as? BonusCollectionViewCell else { return UICollectionViewCell() }
            let datasourse = BonusModel.createMockData()
            cell.configure(with: datasourse)
            return cell
        }
    }
}
