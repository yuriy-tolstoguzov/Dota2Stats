//
//  MatchDetailsViewController.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 5/7/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import ReactorKit


final class MatchDetailsController: BaseViewController, StoryboardView {

    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    private var dataSource: RxCollectionViewSectionedReloadDataSource<MatchDetailsSectionData>?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(MatchDetailsPlayerCell.self, forCellWithReuseIdentifier: MatchDetailsPlayerCell.reuseIdentifier)
        collectionView.register(MatchDetailsPlayersHeader.nib, forSupplementaryViewOfKind: MatchDetailsPlayersHeader.kind, withReuseIdentifier: MatchDetailsPlayersHeader.reuseIdentifier)
        collectionView.addSubview(refreshControl)
        collectionView.delegate = self
        reactor?.action.onNext(.loadHeroes)
    }

    func bind(reactor: MatchDetailsReactor) {
        reactor.state.map { $0.match.title }
            .bind(to: rx.title)
            .disposed(by: disposeBag)

        refreshControl.rx.controlEvent(.valueChanged)
            .map { Reactor.Action.refresh }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        reactor.state.map { $0.isRefreshing }
            .distinctUntilChanged()
            .bind(to: refreshControl.rx.isRefreshing)
            .disposed(by: disposeBag)

        let dataSource = RxCollectionViewSectionedReloadDataSource<MatchDetailsSectionData>(configureCell: { (dataSource, collectionView, indexPath, sectionItem) in
            switch sectionItem {
            case .player(let reactor):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchDetailsPlayerCell.reuseIdentifier, for: indexPath) as! MatchDetailsPlayerCell
                cell.reactor = reactor
                return cell
            case .gameState:
                return UICollectionViewCell()
            }
        })
        dataSource.configureSupplementaryView = { dataSource, collectionView, kind, indexPath in
            var reusableView = UICollectionReusableView()
            if kind == UICollectionElementKindSectionHeader, case let .players(_, reactor) = dataSource[indexPath.section] {
                let playersHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MatchDetailsPlayersHeader.reuseIdentifier, for: indexPath) as! MatchDetailsPlayersHeader
                playersHeader.reactor = reactor
                reusableView = playersHeader
            }

            return reusableView
        }
        self.dataSource = dataSource

        reactor.state.map { $0.sections }
            .bind(to: self.collectionView.rx.items(dataSource: dataSource))
            .disposed(by: self.disposeBag)
    }

}


// MARK: - UICollectionViewDelegateFlowLayout

extension MatchDetailsController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
        guard let sectionItem = self.dataSource?[indexPath] else { return .zero }

        switch sectionItem {
        case .player:
            return CGSize(width: collectionView.bounds.width, height: 44)
        case .gameState:
            return .zero
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 44)
    }

}
