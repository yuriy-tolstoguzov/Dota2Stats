//
//  Team.swift
//  Dota2Stats
//
//  Created by Yury Taustahuzau on 2/6/15.
//  Copyright (c) 2015 Yury Taustahuzau. All rights reserved.
//


import SwiftyJSON


class Team {

    let teamID: Int;
    let teamName: String;
    let teamLogo: String;
    let complete: Bool;

    init (_ attributes: JSON) {
        teamID = attributes["team_id"].intValue;
        teamName = attributes["team_name"].stringValue;
        teamLogo = attributes["team_logo"].stringValue;
        complete = attributes["complete"].boolValue;
    }
    
}
