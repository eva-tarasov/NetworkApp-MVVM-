//
//  HotelListViewModelProtocol.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 18.01.2021.
//  Copyright © 2021 Евгений Тарасов. All rights reserved.
//

import Foundation

protocol HotelListViewModelProtocol {
    var allHotels: [Hotel] { get }
    func fetchHotels(completion: @escaping() -> Void)
    func numberOfRows() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> HotelPreviewCellViewModelProtocol?
    func selectedRow(for indexPath: IndexPath)
    func viewModelForSelectedRow() -> HotelInfoViewModelProtocol?
}
