//
//  HotelPreviewCellViewModelProtocol.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 18.01.2021.
//  Copyright © 2021 Евгений Тарасов. All rights reserved.
//

import Foundation

protocol HotelPreviewCellViewModelProtocol {
    var titleHotel: String { get }
    var starsHotel: String { get }
    var addressHotel: String { get }
    var distanseHotel: String { get }
    var suitesHotel: String { get }
    var previewHotel: Data? { get }
    init(hotel: Hotel)
}
