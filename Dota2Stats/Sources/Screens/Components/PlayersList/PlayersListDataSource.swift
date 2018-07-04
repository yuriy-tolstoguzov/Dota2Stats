//
//  PlayersListDataSource.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 12/24/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit

class PlayersListDataSource: NSObject, UITableViewDataSource {

    var players: [Player] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayersListCell.reuseIdentifier, for: indexPath) as! PlayersListCell
        cell.configure(with: players[indexPath.item])

        return cell
    }

}
