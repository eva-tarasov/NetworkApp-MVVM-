//
//  NetworkManager.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchDataHotels(url: String, completion: @escaping (_ hotel: [Hotel])->()) {
        
        var hotels: [Hotel] = []
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let allIdHotes = try decoder.decode([Hotels].self, from: data)
                
                for idHotel in allIdHotes {
                    guard let idCurrentHotel = idHotel.id else { return }
                    let stringUrlHotel = Links.share.oneHotelLink + String(idCurrentHotel) + ".json"
                    
                    guard let url = URL(string: stringUrlHotel) else { return }
                    
                    URLSession.shared.dataTask(with: url) { (data, _, _) in
                        guard let data = data else { return }
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            
                            let hotel = try decoder.decode(Hotel.self, from: data)
                            hotels.append(hotel)
                            completion(hotels)
                            
                        } catch let error {
                            print(error)
                        }
                    }.resume()
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
