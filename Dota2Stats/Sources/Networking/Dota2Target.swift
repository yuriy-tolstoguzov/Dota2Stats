//
//  Dota2Target.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/27/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import Moya


enum Dota2Target {

    case liveMatches
    case heroes

    static var locale = Locale.current
    static var apiKey = DOTA2_API_KEY

}


// MARK: - TargetType

extension Dota2Target: TargetType {

    var baseURL: URL { return URL(string: "https://api.steampowered.com")! }
    var path: String {
        switch self {
        case .liveMatches:
            return "/IDOTA2Match_570/GetLiveLeagueGames/v0001/"
        case .heroes:
            return "/IEconDOTA2_570/GetHeroes/v0001/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .liveMatches, .heroes:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .liveMatches:
            return Data()
        case .heroes:
            return Data()
        }
        
    }

    var task: Task {
        switch self {
        case .liveMatches, .heroes:
            return .requestParameters(parameters: ["key": Dota2Target.apiKey,
                                                   "language": Dota2Target.locale.languageCode ?? "en"],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .liveMatches, .heroes:
            return [:]
        }
    }

}
