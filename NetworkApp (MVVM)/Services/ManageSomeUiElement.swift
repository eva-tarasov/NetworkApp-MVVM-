//
//  ManageSomeUiElement.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import UIKit

import UIKit

func displayImages(hotel: Hotel, withImage stringUrlImage: String, for imageView: UIImageView ) {
    
    var stringUrlImage = stringUrlImage
    
    DispatchQueue.global().async {
        
        if let idImg = hotel.image  {
            stringUrlImage += idImg
            
            guard let imageUrl = URL(string: stringUrlImage) else { return }
            
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.sync {
                    imageView.image = UIImage(data: imageData)
                }
            } else {
                DispatchQueue.main.sync {
                    imageView.image = UIImage(named: "picture")
                }
            }
            
        } else {
            DispatchQueue.main.sync {
                imageView.image = UIImage(named: "picture")
            }
        }
    }
}

func displayStars(stars: UILabel, countStars: Int) {
    
    switch countStars {
    case 1:
        stars.text = "★☆☆☆☆"
    case 2:
        stars.text = "★★☆☆☆"
    case 3:
        stars.text = "★★★☆☆"
    case 4:
        stars.text = "★★★★☆"
    case 5:
        stars.text = "★★★★★"
    default:
        stars.text = "hotel has't stars"
    }
}

func countOfAvaliableSuites(dataFromHotel: String) -> Int {
    var countOfSuites = dataFromHotel.components(separatedBy: ":")
    
    for (num, item) in countOfSuites.enumerated() {
        if item == "" {
            countOfSuites.remove(at: num)
        }
    }
    return countOfSuites.count
}
