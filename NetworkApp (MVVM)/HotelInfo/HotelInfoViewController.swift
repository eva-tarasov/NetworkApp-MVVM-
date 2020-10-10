//
//  HotelInfoViewController.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import UIKit

class HotelInfoViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var imageHotel: UIImageView!
    @IBOutlet var titleHotel: UILabel!
    @IBOutlet var starsHotel: UILabel!
    @IBOutlet var addressHotel: UILabel!
    @IBOutlet var distanceHotel: UILabel!
    @IBOutlet var freeSuitesHotel: UILabel!
    @IBOutlet var favouriteButton: UIButton!
    
    
    var hotel: Hotel!
    
    private var isFavorit = false
    
    private var viewModel: HotelInfoViewModelProtocol! {
        didSet {
            titleHotel.text = viewModel.hotelName
        }
    }
    
    // MARK: Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HotelInfoViewModel(hotel: hotel)

        loadFavoriteStatus()
        configureHotelScreen()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        isFavorit.toggle()
        let image = setImageForFavoriteButton()
        sender.setImage(image, for: .normal)
        DataManager.shared.saveFavouriteStatus(for: hotel.name ?? "", with: isFavorit)
    }
    
    private func setImageForFavoriteButton() -> UIImage {
        return isFavorit ? #imageLiteral(resourceName: "heartIcon") : #imageLiteral(resourceName: "unselectedHeart")
    }
    
    private func loadFavoriteStatus() {
        isFavorit = DataManager.shared.loadFavouriteStatus(for: hotel.name ?? "")
    }
    
}


extension HotelInfoViewController {
    
    // MARK: - Private Methods
    
    private func configureHotelScreen() {
        
//        titleHotel.text = hotel.name ?? ""
        addressHotel.text = hotel.address ?? ""
        distanceHotel.text = "Distance from center: \(hotel.distance ?? 0)"
        
        displayStars(stars: starsHotel, countStars: hotel.stars ?? 0)
        
        freeSuitesHotel.text = "Free suites: \(hotel.suitesAvailability ?? "0")"
            
        displayImages(hotel: hotel,
                      withImage: Links.share.imgHotelUrl,
                      for: imageHotel)
        
        
        let image = setImageForFavoriteButton()
        favouriteButton.setImage(image, for: .normal)
        
    }
}
