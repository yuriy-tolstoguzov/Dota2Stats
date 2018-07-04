//
//  MatchDetailsPlayersHeaderReactor.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 7/8/18.
//  Copyright © 2018 Yuriy Tolstoguzov. All rights reserved.
//

import ReactorKit


class MatchDetailsPlayersHeaderReactor: Reactor {

    typealias Action = NoAction

    struct State {
        var title: String?
    }

    let initialState: State

    init(title: String?) {
        self.initialState = State(title: title)
    }

}
