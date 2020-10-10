//
//  HotelInfoViewModelProtocol.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import Foundation

protocol HotelInfoViewModelProtocol {
    var hotelName: String? { get }
    init(hotel: Hotel)
}
