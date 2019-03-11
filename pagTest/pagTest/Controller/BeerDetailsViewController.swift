//
//  BeerDetailsViewController.swift
//  pagTest
//
//  Created by Frederico Bechara De Paola on 11/03/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

class BeerDetailsViewController: UIViewController {

    @IBOutlet var mainView: BeerDetailsView!
    public var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = beer?.name
        if let beer = beer {
            mainView.setup(with: beer)
        }
    }

}
