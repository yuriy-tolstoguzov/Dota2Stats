//
//  MatchDetailsPlayersHeaderReactorTests.swift
//  Dota2StatsTests
//
//  Created by Yuriy Tolstoguzov on 7/8/18.
//  Copyright © 2018 Yuriy Tolstoguzov. All rights reserved.
//

import Nimble
import Quick
@testable import Dota2Stats

final class MatchDetailsPlayersHeaderReactorTests: QuickSpec {
    override func spec() {
        var reactor: MatchDetailsPlayersHeaderReactor!
        let headerTitle = "Title"

        beforeEach {
            reactor = MatchDetailsPlayersHeaderReactor(title: headerTitle)
        }

        describe("state.title") {
            it("is same with the initialize parameter value") {
                expect(reactor.currentState.title) == headerTitle
            }
        }
    }
}
