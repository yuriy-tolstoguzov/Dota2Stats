//
//  PlayerDetailsReactor.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 6/7/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import ReactorKit
import RxSwift


final class PlayerShortDetailsReactor: Reactor {

    enum Action {
        case changePlayerName(String?)
        case changeHeroId(Int?)
        case changeHeroes([Hero])
    }

    enum Mutation {
        case setPlayerName(String?)
        case setHeroId(Int?)
        case setHeroes([Hero])
    }

    struct State {
        var playerName: String?
        var heroId: Int?
        var heroes: [Hero]
    }

    let initialState: State

    init(playerName: String? = nil, heroId: Int? = nil, heroes: [Hero] = []) {
        self.initialState = State(playerName: playerName, heroId: heroId, heroes: heroes)
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .changePlayerName(let name):
            return Observable.just(.setPlayerName(name))
        case .changeHeroId(let heroId):
            return Observable.just(.setHeroId(heroId))
        case .changeHeroes(let heroes):
            return Observable.just(.setHeroes(heroes))
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state

        switch mutation {
        case let .setPlayerName(name):
            state.playerName = name
        case let .setHeroId(heroId):
            state.heroId = heroId
        case let .setHeroes(heroes):
            state.heroes = heroes
        }

        return state
    }

}
