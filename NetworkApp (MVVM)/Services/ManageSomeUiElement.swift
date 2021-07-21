//
//  ManageSomeUiElement.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import UIKit

func getImageData(from urlOfImage: String?) -> Data? {
    guard var stringUrl = urlOfImage else { return nil }
    stringUrl = Links.share.imgHotelUrl + stringUrl
    guard let imageUrl = URL(string: stringUrl) else { return nil }
    guard let imageData = try? Data(contentsOf: imageUrl) else { return nil }
    return imageData
}

func displayStars(countStars: Int) -> String {
    
    switch countStars {
    case 1:
        return "★☆☆☆☆"
    case 2:
        return "★★☆☆☆"
    case 3:
        return "★★★☆☆"
    case 4:
        return "★★★★☆"
    case 5:
        return "★★★★★"
    default:
        return "hotel has't stars"
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
