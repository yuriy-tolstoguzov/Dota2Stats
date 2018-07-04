//
//  BaseService.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/30/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import Foundation


class BaseService {

    unowned let provider: ServiceProviderType

    init(provider: ServiceProviderType) {
        self.provider = provider
    }

}
