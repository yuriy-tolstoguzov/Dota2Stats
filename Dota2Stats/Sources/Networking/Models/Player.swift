//
//  Player.swift
//  Dota2Stats
//
//  Created by Yury Taustahuzau on 2/6/15.
//  Copyright (c) 2015 Yury Taustahuzau. All rights reserved.
//


import SwiftyJSON;


class Player {

    let steamID: String;
    let communityVisibilityState: Bool;
    let profileState: String;
    let personaName: String;
    let lastLogoff: String;
    let profileURL: String;
    let avatar: String;
    let avatarMedium: String;
    let avatarFull: String;
    let personaState: Int;
    let realName: String;
    let timeCreated: String;
    let primaryClanID: String;
    let locCountryCode: String;
    let locStateCode: String;
    let locCityID: Int;


    init ( attributes: JSON) {
        steamID = attributes["steamid"].stringValue;
        communityVisibilityState = attributes["communityvisibilitystate"].boolValue;
        profileState = attributes["profilestate"].stringValue;
        personaName = attributes["personaname"].stringValue;
        lastLogoff = attributes["lastlogoff"].stringValue;
        profileURL = attributes["profileurl"].stringValue;
        avatar = attributes["avatar"].stringValue;
        avatarMedium = attributes["avatarmedium"].stringValue;
        avatarFull = attributes["avatarfull"].stringValue;
        personaState = attributes["personastate"].intValue;
        realName = attributes["realname"].stringValue;
        primaryClanID = attributes["primaryclanid"].stringValue;
        timeCreated = attributes["timecreated"].stringValue;
        locCountryCode = attributes["loccountrycode"].stringValue;
        locStateCode = attributes["locstatecode"].stringValue;
        locCityID = attributes["loccityid"].intValue;
    }
    
}
