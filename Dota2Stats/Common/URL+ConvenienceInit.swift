//
//  URL+ConvenienceInit.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 5/29/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import Foundation


extension URL {

    static func makeURL(with string: String) -> URL {
        if let url = URL(string: string) {
            return url
        }
        else {
            assertionFailure("URL was not initialized successfully")
            return URL(string: "")!
        }
    }

    static func makeHeroImageURL(with heroId: Int, heroes: [Hero]) -> URL {
        return URL(string: "https://d1u5p3l4wpay3k.cloudfront.net/dota2_gamepedia/2/23/Axe_icon.png?version=2e5863c038d81ddef209c68b3e840d2c")!
        // TODO: Find different API that provides images/image urls for heros
//        guard let hero = heroes.first(where: { $0.id == heroId }) else { return URL.makeURL(with: "") }
//        if let url = hero.urlSmallPortrait.flatMap(URL.init(string:)) {
//            return url
//        }
//        else {
//            assertionFailure("URL was not initialized successfully")
//            return URL(string: "")!
//        }
    }

}
