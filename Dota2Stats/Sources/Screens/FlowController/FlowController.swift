//
//  FlowController.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 5/7/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit


class FlowController {

    static let `default` = FlowController()

    private let serviceProvider: ServiceProviderType = ServiceProvider()


    func prepareRootController(in window: UIWindow) {
        guard let controller = (window.rootViewController as? UINavigationController)?.viewControllers.first as? MatchesViewController else {
            fatalError("Root controller of Main.storyboard is not UINavigationController(MatchesViewController).")
        }

        controller.reactor = MatchesReactor(provider: serviceProvider)
    }

    func showMatchDetails(from source: BaseViewController, with match: LeagueMatch) {
        let destination = StoryboardScene.MatchDetails.initialScene.instantiate()
        destination.reactor = MatchDetailsReactor(provider: serviceProvider, match: match)

        source.show(destination, sender: nil)
    }

}
