//
//  Hotel.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

struct Hotel: Decodable {
    var id: Int?
    var name: String?
    var address: String?
    var stars: Int?
    var distance: Double?
    var image: String?
    var suitesAvailability: String?
}
