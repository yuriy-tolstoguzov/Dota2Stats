//
//  LeagueMatch.swift
//  Dota2Stats
//
//  Created by Yury Taustahuzau on 2/6/15.
//  Copyright (c) 2015 Yury Taustahuzau. All rights reserved.
//


import SwiftyJSON;


class LeagueMatch {

    let players: [Player];
    let radiantTeam: Team;
    let direTeam: Team;
    let lobbyID: Int;
    let spectators: Int;
    let towerState: Int;
    let leagueID: Int;

    init (attributes: JSON) {
        lobbyID = attributes["lobby_id"].intValue;
        leagueID = attributes["league_id"].intValue;
        spectators = attributes["spectators"].intValue;
        towerState = attributes["tower_state"].intValue;

        let playerAttributes = attributes["players"].arrayValue;

        var players = [Player]();
        for playerAttribute in playerAttributes {
            players.append(Player(attributes: playerAttribute));
        }
        self.players = players;

        radiantTeam = Team(attributes["radiant_team"]);
        direTeam = Team(attributes["dire_team"]);
    }

}
