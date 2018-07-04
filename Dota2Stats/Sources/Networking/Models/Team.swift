//
//  Team.swift
//  Dota2Stats
//
//  Created by Yury Taustahuzau on 2/6/15.
//  Copyright (c) 2015 Yury Taustahuzau. All rights reserved.
//


import SwiftyJSON


struct Team {

    let id: Int
    let name: String
    let logo: String?
    let isComplete: Bool

    init?(_ attributes: JSON) {
        guard let id = attributes["team_id"].int,
            let name = attributes["team_name"].string,
            let isComplete = attributes["complete"].bool else {
                return nil
        }
        self.id = id
        self.name = name
        self.isComplete = isComplete
        logo = attributes["team_logo"].string
    }
    
}


extension Team: Equatable {

    public static func ==(lhs: Team, rhs: Team) -> Bool {
        return lhs.id == rhs.id
    }

}


extension Team: CustomStringConvertible {

    var description: String {
        return "{ teamID: \(id), teamName: \(name) }"
    }
    
}
