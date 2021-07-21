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
    
    private var isFavorit = false
    
    var viewModel: HotelInfoViewModelProtocol!
    
    // MARK: Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHotelScreen()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.changeFavouriteStatus()
        let image = setImageForFavoriteButton()
        sender.setImage(image, for: .normal)
    }
    
    private func setImageForFavoriteButton() -> UIImage {
        return isFavorit ? #imageLiteral(resourceName: "heartIcon") : #imageLiteral(resourceName: "unselectedHeart")
    }
}


extension HotelInfoViewController {
    
    // MARK: - Private Methods
    
    private func configureHotelScreen() {

        // работа через свойство viewModelDidChange плоха тем, что при смене одного свойства isFavorit мы отслеживаем изменения, и передаем в свойтсво viewModelDidChange всю модель целиком

//        viewModel.viewModelDidChange = { [weak self] viewModel in
//            guard let self = self else { return }
//            self.isFavorit = viewModel.isFavorite
//        }

        viewModel.isFavorite.bind { [weak self] isFavourite in
            guard let self = self else { return }
            self.isFavorit = isFavourite
        }

        titleHotel.text = viewModel.hotelName
        addressHotel.text = viewModel.address
        distanceHotel.text = viewModel.distance
        starsHotel.text = viewModel.stars
        freeSuitesHotel.text = viewModel.suitesAvailability
        if let imageData = viewModel.image {
            imageHotel.image = UIImage(data: imageData)
        } else {
            imageHotel.image = UIImage(named: "picture")
        }
        viewModel.setFavouriteStatus()


        let image = setImageForFavoriteButton()
        favouriteButton.setImage(image, for: .normal)
    }
}
