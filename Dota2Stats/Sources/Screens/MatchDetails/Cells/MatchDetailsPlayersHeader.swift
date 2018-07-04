//
//  MatchDetailsPlayersHeader.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 7/8/18.
//  Copyright © 2018 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit


class MatchDetailsPlayersHeader: UICollectionReusableView, ReactorKit.View, LoadableFromXIB {

    typealias Reactor = MatchDetailsPlayersHeaderReactor

    @IBOutlet weak var title: UILabel!
    static let reuseIdentifier = "MatchDetailsPlayersHeader"
    static let kind = UICollectionElementKindSectionHeader
    static var nib: UINib {
        return UINib(nibName: self.xibName, bundle: .main)
    }
    var disposeBag = DisposeBag()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func bind(reactor: MatchDetailsPlayersHeader.Reactor) {
        reactor.state.map { $0.title }
            .bind(to: title.rx.text)
            .disposed(by: disposeBag)
    }

}
