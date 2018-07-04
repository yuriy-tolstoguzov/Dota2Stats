//
//  BaseViewController.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/27/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit


class BaseViewController: UIViewController {
    
    // MARK: Rx
    
    var disposeBag = DisposeBag()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        disposeBag = DisposeBag()
    }

}
