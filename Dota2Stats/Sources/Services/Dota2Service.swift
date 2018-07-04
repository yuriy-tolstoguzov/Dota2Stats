//
//  Dota2Service.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/30/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import RxSwift
import SwiftyJSON


protocol Dota2ServiceType {

    func liveMatches() -> Observable<[LeagueMatch]>
    func heroes() -> Observable<[Hero]>

}


final class Dota2Service: BaseService, Dota2ServiceType {

    func liveMatches() -> Observable<[LeagueMatch]> {
        return provider.networking.rx.request(.liveMatches)
            .asObservable()
            .map { JSON($0.data)["result"]["games"].array ?? [] }
            .map { $0.compactMap(LeagueMatch.init) }
    }

    func heroes() -> Observable<[Hero]> {
        return provider.networking.rx.request(.heroes)
            .asObservable()
            .map { JSON($0.data)["result"]["heroes"].array ?? [] }
            .map { $0.compactMap(Hero.init) }
    }

}
