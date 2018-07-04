//
//  MatchDetailsSectionData.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 7/7/18.
//  Copyright © 2018 Yuriy Tolstoguzov. All rights reserved.
//

import Foundation
import RxDataSources

enum MatchDetailsSectionData {

    case players([MatchDetailsSectionItem], MatchDetailsPlayersHeaderReactor)
    case gameState([MatchDetailsSectionItem])

}

enum MatchDetailsSectionItem {

    case player(MatchDetailsPlayerReactor)
    case gameState()

}

extension MatchDetailsSectionData: SectionModelType {

    var items: [MatchDetailsSectionItem] {
        switch self {
        case .players(let items, _): return items
        case .gameState(let items): return items
        }
    }

    init(original: MatchDetailsSectionData, items: [MatchDetailsSectionItem]) {
        switch original {
        case .players(_, let reactor): self = .players(items, reactor)
        case .gameState: self = .gameState(items)
        }
    }

}
