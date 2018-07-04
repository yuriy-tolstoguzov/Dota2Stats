//
//  Hero.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 5/29/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import SwiftyJSON


struct Hero {

    let id: Int
    let name: String
    let localizedName: String?

    init?(_ attributes: JSON) {
        guard let id = attributes["id"].int,
            let name = attributes["name"].string else {
                return nil
        }
        self.id = id
        self.name = name
        localizedName = attributes["localized_name"].string
    }

}
