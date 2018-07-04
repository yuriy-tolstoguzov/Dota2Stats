//
//  Player.swift
//  Dota2Stats
//
//  Created by Yury Taustahuzau on 2/6/15.
//  Copyright (c) 2015 Yury Taustahuzau. All rights reserved.
//


import SwiftyJSON;


struct Player {

    let accountID: Int
    let heroID: Int?
    let name: String
    let team: Int?

    init?(_ attributes: JSON) {
        guard let accountID = attributes["account_id"].int,
            let name = attributes["name"].string else {
                return nil
        }

        self.accountID = accountID
        self.name = name
        heroID = attributes["hero_id"].int
        team = attributes["team"].int
    }
    
}


extension Player: Equatable {
    
    public static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs.accountID == rhs.accountID
    }
    
}


extension Player: CustomStringConvertible {

    var description: String {
        return "{ \(accountID): \(name) }"
    }

}
