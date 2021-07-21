//
//  HotelInfoViewModel.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import Foundation

class HotelInfoViewModel: HotelInfoViewModelProtocol {

    var hotelName: String? {
        return hotel.name
    }

    var address: String? {
        return hotel.address
    }

    var stars: String? {
        return displayStars(countStars: hotel.stars ?? 0)
    }

    var distance: String? {
        return "Distance from center: \(hotel.distance ?? 0)"
    }

    var image: Data? {
        getImageData(from: hotel.image)
    }

    var suitesAvailability: String? {
        return "Free suites: \(hotel.suitesAvailability ?? "0")"
    }
    
//    var isFavorite: Bool {
//        get {
//            return DataManager.shared.loadFavouriteStatus(for: hotel.name ?? "")
//        }
//        set {
//            DataManager.shared.saveFavouriteStatus(for: hotel.name ?? "", with: newValue)
//        }
//    }

    // быдем следить за свойством isFavorite с помощью свойства viewModelDidChange, и при каждом изменении isFavorite будем передавать в него модель данных

    // таким образом можно сделать свойтво приватным если оно пределено в протоколе (точнее его не смогу изменить снаружи)
    private (set) var isFavorite: Box<Bool>

//    var viewModelDidChange: ((HotelInfoViewModelProtocol) -> Void)?

    private var hotel: Hotel!

    required init(hotel: Hotel) {
        self.hotel = hotel
        isFavorite = Box(false)
    } 

    func setFavouriteStatus() {
        isFavorite.value = DataManager.shared.loadFavouriteStatus(for: hotel.name ?? "")
    }

    func changeFavouriteStatus() {
        isFavorite.value.toggle()
        DataManager.shared.saveFavouriteStatus(for: hotel.name ?? "", with: isFavorite.value)
    }
}
