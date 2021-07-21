//
//  HotelPreviewCellViewModel.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 18.01.2021.
//  Copyright © 2021 Евгений Тарасов. All rights reserved.
//

import Foundation

class HotelPreviewCellViewModel: HotelPreviewCellViewModelProtocol {

    var titleHotel: String {
        return hotel.name ?? ""
    }
    var starsHotel: String {
        return displayStars(countStars: hotel.stars ?? 0)
    }
    var addressHotel: String {
        return hotel.address ?? ""
    }
    var distanseHotel: String {
        return "Distance: \(hotel.distance ?? 0.0)"
    }
    var suitesHotel: String {
        return "Count of suites: \(countOfAvaliableSuites(dataFromHotel: hotel.suitesAvailability ?? ""))"
    }
    var previewHotel: Data? {
        getImageData(from: hotel.image)
    }

    private var hotel: Hotel

    required init(hotel: Hotel) {
        self.hotel = hotel
    }
}
