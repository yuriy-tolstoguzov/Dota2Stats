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

    static var reuseIdentifier = "LeagueMatchCell"

    func configure(with match: LeagueMatch) {
        firstTeamLabel.text = match.radiantTeam?.name ?? "<no name>"
        secondTeamLabel.text = match.direTeam?.name ?? "<no name>"
        identifierLabel.text = String(match.id)
    }
}
