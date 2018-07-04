//
//  LeagueMatch.swift
//  Dota2Stats
//
//  Created by Yury Taustahuzau on 2/6/15.
//  Copyright (c) 2015 Yury Taustahuzau. All rights reserved.
//


import SwiftyJSON


struct LeagueMatch {

    let id: Int
    let leagueID: Int?
    let players: [Player]
    let radiantTeam: Team?
    let direTeam: Team?
    let spectators: Int

    init?(_ attributes: JSON) {
        guard let matchID = attributes["match_id"].int,
            let spectators = attributes["spectators"].int else {
            return nil
        }
        
        self.id = matchID
        self.spectators = spectators
        leagueID = attributes["league_id"].int
        players = (attributes["players"].array ?? []).compactMap(Player.init)
        radiantTeam = Team(attributes["radiant_team"])
        direTeam = Team(attributes["dire_team"])
    }

}


extension LeagueMatch: Equatable {

    public static func ==(lhs: LeagueMatch, rhs: LeagueMatch) -> Bool {
        return lhs.id == rhs.id
    }

}


extension LeagueMatch: CustomStringConvertible {

    var description: String {
        return "{ matchID: \(id), players: \(players) }"
    }
    
}

extension LeagueMatch {

    var title: String {
        let defaultName = "<no name>"
        return "\(self.radiantTeam?.name ?? defaultName) vs \(self.direTeam?.name ?? defaultName)"
    }

}
