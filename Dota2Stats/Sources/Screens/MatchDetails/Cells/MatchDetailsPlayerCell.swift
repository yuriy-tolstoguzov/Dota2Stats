//
//  MatchDetailsPlayerCell.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 7/7/18.
//  Copyright © 2018 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit
import PureLayout
import RxSwift
import ReactorKit


class MatchDetailsPlayerCell: UICollectionViewCell, ReactorKit.View {

    typealias Reactor = MatchDetailsPlayerReactor

    static let reuseIdentifier = "MatchDetailsPlayerCell"
    let playerDetailsView: PlayerShortDetailsView
    let playerDetailsReactor = PlayerShortDetailsReactor()
    var disposeBag = DisposeBag()

    required init?(coder: NSCoder) {
        fatalError("Call of constructor init?(coder: NSCoder) of MatchDetailsPlayerCell is not implemented")
    }

    override init(frame: CGRect) {
        let nibViews = PlayerShortDetailsView.defaultNib.instantiate(withOwner: nil)
        guard let playerDetailsView = nibViews.first as? PlayerShortDetailsView else {
            fatalError("View '\(PlayerShortDetailsView.self)' returned not expected instance of class \(PlayerShortDetailsView.self).")
        }
        playerDetailsView.reactor = playerDetailsReactor
        self.playerDetailsView = playerDetailsView

        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(playerDetailsView)
        playerDetailsView.autoPinEdgesToSuperviewEdges()
    }

    func bind(reactor: MatchDetailsPlayerReactor) {
        reactor.state.map { $0.player }
            .map { PlayerShortDetailsReactor.Action.changePlayerName($0.name) }
            .bind(to: playerDetailsReactor.action)
            .disposed(by: disposeBag)
        reactor.state.map { $0.player }
            .map { PlayerShortDetailsReactor.Action.changeHeroId($0.heroID) }
            .bind(to: playerDetailsReactor.action)
            .disposed(by: disposeBag)
        reactor.state.map { $0.heroes }
            .map { PlayerShortDetailsReactor.Action.changeHeroes($0) }
            .bind(to: playerDetailsReactor.action)
            .disposed(by: disposeBag)
    }

}
