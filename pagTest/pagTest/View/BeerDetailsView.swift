//
//  BeerDetailsView.swift
//  pagTest
//
//  Created by Frederico Bechara De Paola on 11/03/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

class BeerDetailsView: UIView {

    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerTagline: UILabel!
    @IBOutlet weak var beerAlcoholLevel: UILabel!
    @IBOutlet weak var beerBitterness: UILabel!
    @IBOutlet weak var beerDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with beer: Beer) {
        if let url = URL(string: beer.imageURL ?? "") {
            beerImage.kf.indicatorType = .activity
            beerImage.kf.setImage(with: url)
        }
        beerName.text = beer.name
        beerTagline.text = beer.tagline
        beerAlcoholLevel.text = String(format:"%.2f", beer.abv ?? 0)
        beerBitterness.text = String(format:"%.2f", beer.ibu ?? 0)
        beerDescription.text = beer.description
        beerDescription.sizeToFit()
    }
    
}


//●    Imagem da cerveja (image_url).
//    ●    Exibir nome (name)
//        ●    Tagline (tagline)
//        ●    Teor alcoólico (abv)
//            ●    Escala de amargor (ibu)
//                ●    Descrição (description)
