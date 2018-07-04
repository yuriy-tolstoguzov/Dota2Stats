//
//  HeroTests.swift
//  Dota2StatsTests
//
//  Created by Yuriy Tolstoguzov on 7/8/18.
//  Copyright © 2018 Yuriy Tolstoguzov. All rights reserved.
//

import Nimble
import Quick
import SwiftyJSON
@testable import Dota2Stats

final class HeroTests: QuickSpec {
    override func spec() {
        var hero: Hero!

        beforeEach {
            let jsonPath = Bundle.init(for: type(of: self)).path(forResource: "Hero", ofType: "json")!
            let jsonData = NSData(contentsOfFile: jsonPath)! as Data
            let json = try! JSON(data: jsonData)
            hero = Hero(json)
        }

        describe("Hero") {
            it("has same id as json file") {
                expect(hero.id) == 11
            }
            it("has same name as json file") {
                expect(hero.name) == "Axe"
            }
            it("has same localized name as json file") {
                expect(hero.localizedName) == "Akse"
            }
        }
    }
}
