//
//  Dota2Service.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/27/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import Moya


enum Dota2Service {

    case liveMatches

}


// MARK: - TargetType

extension Dota2Service: TargetType {

    var baseURL: URL { return URL(string: "http://api.steampowered.com")! }
    var path: String {
        switch self {
        case .liveMatches:
            return "/IDOTA2Match_570/GetLiveLeagueGames/v0001/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .liveMatches:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .liveMatches:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding {
        switch self {
        case .liveMatches:
            return URLEncoding.default // Send parameters in URL
        }
    }

    var sampleData: Data {
        switch self {
        case .liveMatches:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }

    var task: Task {
        switch self {
        case .liveMatches:
            return .request
        }
    }

}

// MARK: - Helpers

private extension String {

    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }

}
