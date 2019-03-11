//
//  BeerTableViewCell.swift
//  pagTest
//
//  Created by Frederico Bechara De Paola on 10/03/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerAlcoholLevel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        beerImage.image = nil
        beerName.text = nil
        beerAlcoholLevel.text = nil
    }
    
    func setup(with beer: Beer) {
        if let url = URL(string: beer.imageURL ?? "") {
            beerImage.kf.indicatorType = .activity
            beerImage.kf.setImage(with: url)
        }
        beerName.text = beer.name
        beerAlcoholLevel.text = String(format:"%.2f", beer.abv ?? 0)
    }
    
}
