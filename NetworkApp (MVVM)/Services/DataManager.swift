//
//  DataManager.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    func saveFavouriteStatus(for hotelName: String, with status: Bool) {
        userDefaults.set(status, forKey: hotelName)
    }
    
    func loadFavouriteStatus(for hotelName: String) -> Bool {
        return userDefaults.bool(forKey: hotelName)
    }
}
