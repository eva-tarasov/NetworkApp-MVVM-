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
    
    private var hotel: Hotel!
    
    required init(hotel: Hotel) {
        self.hotel = hotel
    }
    
    
}
