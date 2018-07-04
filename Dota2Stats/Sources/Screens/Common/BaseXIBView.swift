//
//  LoadableFromXIB.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 5/28/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit

protocol LoadableFromXIB {

    static var xibName: String { get }

}


extension LoadableFromXIB where Self: UIView {

    static var xibName: String {
        return String(describing: self)
    }

    static func instantiateFromXIB(from bundle: Bundle = .main, with owner: Any? = nil) -> UIView {
        return bundle.loadNibNamed(xibName, owner: owner, options: nil)?.first! as! UIView
    }

}
