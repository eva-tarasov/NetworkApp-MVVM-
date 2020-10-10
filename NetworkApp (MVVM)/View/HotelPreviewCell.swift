//
//  HotelPreviewCell.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import UIKit

class HotelPreviewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var starsLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var distanseLabel: UILabel!
    @IBOutlet var suitesLabel: UILabel!
    @IBOutlet var previewHotelImg: UIImageView!
    
    func configure(with cell: Hotel) {
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        
        titleLabel.text = cell.name ?? ""
        
        displayStars(stars: starsLabel, countStars: cell.stars ?? 0)
        
        addressLabel.text = cell.address ?? ""
        distanseLabel.text = "Distance: \(cell.distance ?? 0.0)"
        let countOfSuites = countOfAvaliableSuites(dataFromHotel: cell.suitesAvailability ?? "")
        
        suitesLabel.text = "Count of suites: \(countOfSuites)"
            
            displayImages(hotel: cell,
                          withImage: Links.share.imgHotelUrl,
                          for: self.previewHotelImg)
        
    }
}
