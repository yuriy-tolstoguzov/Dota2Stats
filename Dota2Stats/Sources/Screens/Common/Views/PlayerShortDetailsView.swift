//
//  PlayerShortDetailsView.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 5/28/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit
import ReactorKit
import Kingfisher


class PlayerShortDetailsView: BaseView, LoadableFromXIB, ReactorKit.View {

    typealias Reactor = PlayerShortDetailsReactor

    static var defaultNib = UINib(nibName: PlayerShortDetailsView.xibName, bundle: .main)

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    func bind(reactor: PlayerShortDetailsReactor) {
        reactor.state.map { $0.playerName }
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)

        reactor.state.filter { $0.heroId != nil }
            .map { URL.makeHeroImageURL(with: $0.heroId!, heroes: $0.heroes) }
            .subscribe(onNext: { [weak self] (url) in
                self?.heroImageView.kf.setImage(with: url)
            })
            .disposed(by: disposeBag)
    }

}
