//
//  MatchDetailsPlayerReactor.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 7/7/18.
//  Copyright © 2018 Yuriy Tolstoguzov. All rights reserved.
//

import ReactorKit


class MatchDetailsPlayerReactor: Reactor {

    typealias Action = NoAction

    struct State {
        var player: Player
        var heroes: [Hero]
    }

    let initialState: State

    init(player: Player, heroes: [Hero]) {
        self.initialState = State(player: player, heroes: heroes)
    }

}
