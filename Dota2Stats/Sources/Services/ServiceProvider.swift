//
//  ServiceProvider.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/30/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import Moya


protocol ServiceProviderType: class {

    var networking: MoyaProvider<Dota2Target> { get }
    var dota2: Dota2ServiceType { get }

}


final class ServiceProvider: ServiceProviderType {

    lazy var networking: MoyaProvider<Dota2Target> = .init()
    lazy var dota2: Dota2ServiceType = Dota2Service(provider: self)

}
