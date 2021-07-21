//
//  HotelPreviewCell.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import UIKit

class HotelPreviewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var starsLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var distanseLabel: UILabel!
    @IBOutlet var suitesLabel: UILabel!
    @IBOutlet var previewHotelImg: UIImageView!

    var viewModel: HotelPreviewCellViewModelProtocol! {
        didSet {
            layer.cornerRadius = 8
            layer.borderWidth = 1
            layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)

            titleLabel.text = viewModel.titleHotel
            starsLabel.text = viewModel.starsHotel
            addressLabel.text = viewModel.addressHotel
            distanseLabel.text = viewModel.distanseHotel
            suitesLabel.text = viewModel.suitesHotel
            if let previewHotel = viewModel.previewHotel {
                previewHotelImg.image = UIImage(data: previewHotel)
            } else {
                previewHotelImg.image = UIImage(named: "picture")
            }
        }
    }
}
