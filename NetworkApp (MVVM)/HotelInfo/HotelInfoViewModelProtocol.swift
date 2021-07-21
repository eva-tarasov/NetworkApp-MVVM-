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
    var address: String? { get }
    var stars: String? { get }
    var distance: String? { get }
    var image: Data? { get }
    var suitesAvailability: String? { get }
    var isFavorite: Box<Bool> { get }
//    var viewModelDidChange: ((HotelInfoViewModelProtocol) -> Void)? { get set }
    func setFavouriteStatus()
    func changeFavouriteStatus()

    init(hotel: Hotel)
}
