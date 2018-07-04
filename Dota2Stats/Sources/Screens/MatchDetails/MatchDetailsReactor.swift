//
//  MatchDetailsReactor.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 5/7/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import ReactorKit
import RxSwift


final class MatchDetailsReactor: Reactor {

    enum Action {
        case loadHeroes
        case refresh
    }

    enum Mutation {
        case setHeroes([Hero])
        case setRefreshing(Bool)
    }

    struct State {
        let match: LeagueMatch
        var sections: [MatchDetailsSectionData]
        var isRefreshing: Bool
        var isError: Bool
        var heroes: [Hero]
    }

    let provider: ServiceProviderType
    let initialState: State

    init(provider: ServiceProviderType, match: LeagueMatch) {
        self.provider = provider
        let sections = [MatchDetailsSectionData]()
        self.initialState = State(match: match, sections: sections, isRefreshing: false, isError: false, heroes: [])
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadHeroes:
            return provider.dota2.heroes()
                .map { Mutation.setHeroes($0) }
        case .refresh:
            return Observable<Mutation>.just(.setRefreshing(false))
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state

        switch mutation {
        case let .setHeroes(heroes):
            state.heroes = heroes
            state.sections = makeSections(with: state.match, use: heroes)
        case let .setRefreshing(isRefreshing):
            state.isRefreshing = isRefreshing
        }

        return state
    }

    private func makeSections(with match: LeagueMatch, use heroes: [Hero]) -> [MatchDetailsSectionData] {
        let direTeamId = 0, radiantTeamId = 1, adminTeamId = 2

        let direPlayers = match.players
            .filter { $0.team == direTeamId }
            .map { ($0, heroes) }
            .map(makeItem)
        let direSectionReactor = MatchDetailsPlayersHeaderReactor(title: NSLocalizedString("Dire Team", comment: "Dire Team Section Title"))

        let radiantPlayers = match.players
            .filter { $0.team == radiantTeamId }
            .map { ($0, heroes) }
            .map(makeItem)
        let radiantSectionReactor = MatchDetailsPlayersHeaderReactor(title: NSLocalizedString("Radiant Team", comment: "Radiant Team Section Title"))

        let admins = match.players
            .filter { $0.team == adminTeamId }
            .map { ($0, heroes) }
            .map(makeItem)
        let adminsSectionReactor = MatchDetailsPlayersHeaderReactor(title: NSLocalizedString("Admins", comment: "Admin Team Section Title"))

        return [
            .players(direPlayers, direSectionReactor),
            .players(radiantPlayers, radiantSectionReactor),
            .players(admins, adminsSectionReactor)
        ]
    }

    private func makeItem(for player: Player, use heroes: [Hero]) -> MatchDetailsSectionItem {
        let reactor = MatchDetailsPlayerReactor(player: player, heroes: heroes)
        return MatchDetailsSectionItem.player(reactor)
    }

}
