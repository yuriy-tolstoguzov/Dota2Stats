//
//  LeagueMatchCell.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/27/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit


class LeagueMatchCell : UITableViewCell {

    @IBOutlet weak var firstTeamLabel: UILabel!
    @IBOutlet weak var secondTeamLabel: UILabel!
    @IBOutlet weak var identifierLabel: UILabel!

    class func reuseIdentifier() -> String {
        return "LeagueMatchCell"
    }

    func configureWithMatch(match: LeagueMatch) {
        firstTeamLabel.text = match.radiantTeam.teamName
        secondTeamLabel.text = match.direTeam.teamName
        identifierLabel.text = String(match.lobbyID)
    }
}
