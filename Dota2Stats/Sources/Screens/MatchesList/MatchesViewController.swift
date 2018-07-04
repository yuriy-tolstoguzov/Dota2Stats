//
//  MatchesViewController.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/25/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit
import RxSwift
import RxSwiftExt
import RxCocoa
import ReactorKit


final class MatchesViewController: BaseViewController, StoryboardView {

    @IBOutlet private weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Live Matches", comment: "Title of Live Matches Screen")

        tableView.addSubview(refreshControl)
        reactor?.action.onNext(.refresh)
    }


    // MARK: Configuring

    func bind(reactor: MatchesReactor) {
        rx.viewDidAppear
            .map { _ in Reactor.Action.clearSelection }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        refreshControl.rx.controlEvent(.valueChanged)
            .map { Reactor.Action.refresh }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        tableView.rx.modelSelected(LeagueMatch.self)
            .map { Reactor.Action.selectMatch($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state.map { $0.isRefreshing }
            .distinctUntilChanged()
            .bind(to: refreshControl.rx.isRefreshing)
            .disposed(by: disposeBag)
        reactor.state.map { $0.matches }
            .distinctUntilChanged(==)
            .bind(to: tableView.rx.items(cellIdentifier: LeagueMatchCell.reuseIdentifier, cellType: LeagueMatchCell.self)) { (index, match, cell) in
                cell.configure(with: match)
            }
            .disposed(by: disposeBag)
        reactor.state.map { $0.selectedMatch }.asDriver(onErrorJustReturn: nil)
            .distinctUntilChanged(==)
            .map { $0 == nil }
            .drive(view.rx.isUserInteractionEnabled)
            .disposed(by: disposeBag)
        reactor.state.map { $0.selectedMatch }
            .unwrap()
            .subscribe(onNext: { (match) in
                FlowController.default.showMatchDetails(from: self, with: match)
            })
            .disposed(by: disposeBag)
    }

}

