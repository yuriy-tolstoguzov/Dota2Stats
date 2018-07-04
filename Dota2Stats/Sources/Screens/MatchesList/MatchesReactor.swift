//
//  MatchesReactor.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/30/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import ReactorKit
import RxSwift


final class MatchesReactor: Reactor {

    enum Action {
        case refresh
        case selectMatch(LeagueMatch)
        case clearSelection
    }

    enum Mutation {
        case setRefreshing(Bool)
        case setMatches([LeagueMatch])
        case selectMatch(LeagueMatch?)
    }

    struct State {
        var isRefreshing = false
        var isError = false
        var matches = [LeagueMatch]()
        var selectedMatch: LeagueMatch?
    }

    let provider: ServiceProviderType
    let initialState: State

    init(provider: ServiceProviderType) {
        self.provider = provider
        self.initialState = State()
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .refresh:
            guard !self.currentState.isRefreshing else { return .empty() }

            let startRefreshing = Observable<Mutation>.just(.setRefreshing(true))
            let setLiveMatches = provider.dota2.liveMatches()
                .map { Mutation.setMatches($0) }
            let endRefreshing = Observable<Mutation>.just(.setRefreshing(false))

            return .concat([startRefreshing, setLiveMatches, endRefreshing])
        case .selectMatch(let match):
            return Observable<Mutation>.just(.selectMatch(match))
        case .clearSelection:
            return Observable<Mutation>.just(.selectMatch(nil))
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state

        switch mutation {
        case let .setRefreshing(isRefreshing):
            state.isRefreshing = isRefreshing
        case let .setMatches(matches):
            state.matches = matches
        case let .selectMatch(match):
            guard state.selectedMatch == nil || match == nil else { return state }
            state.selectedMatch = match
        }

        return state
    }

}
