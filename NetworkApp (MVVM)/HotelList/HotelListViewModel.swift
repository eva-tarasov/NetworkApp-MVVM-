//
//  HotelListViewModel.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 18.01.2021.
//  Copyright © 2021 Евгений Тарасов. All rights reserved.
//

import Foundation

class HotelListViewModel: HotelListViewModelProtocol {
    
    var allHotels: [Hotel] = []
    private var indexPath: IndexPath?
    
    func fetchHotels(completion: @escaping() -> Void) {
        NetworkManager.shared.fetchDataHotels(url: Links.share.allHotelsUrl) { hotels in
            self.allHotels = hotels
            completion()
        }
    }
    
    func numberOfRows() -> Int? {
        return allHotels.count
    }

    func cellViewModel(for indexPath: IndexPath) -> HotelPreviewCellViewModelProtocol? {
        let hotel = allHotels[indexPath.row]
        return HotelPreviewCellViewModel(hotel: hotel)
    }

    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }

    func viewModelForSelectedRow() -> HotelInfoViewModelProtocol? {
        guard let indexPath = indexPath else { return nil }
        let hotel = allHotels[indexPath.row]
        return HotelInfoViewModel(hotel: hotel)
    }
}
