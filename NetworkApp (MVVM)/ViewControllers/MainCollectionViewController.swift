//
//  MainCollectionViewController.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 10.10.2020.
//  Copyright © 2020 Евгений Тарасов. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var actvityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private Properties
    
    private var allHotels: [Hotel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actvityIndicator.startAnimating()
        actvityIndicator.hidesWhenStopped = true
        
        NetworkManager.shared.fetchDataHotels(url: Links.share.allHotelsUrl) { (hotels) in
            self.allHotels = hotels
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.actvityIndicator.stopAnimating()
            }
        }
        
        setupNavigationBar()
        
    }
    
    // MARK: Private Methods
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }


    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allHotels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellHotel", for: indexPath) as! HotelPreviewCell
    
        let hotel = allHotels[indexPath.row]
        
        cell.configure(with: hotel)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentIdHotel = allHotels[indexPath.item]
        performSegue(withIdentifier: "showHotelInformation", sender: currentIdHotel)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showHotelInformation" else { return }
        let hotelInfoVC = segue.destination as! HotelInfoViewController
        hotelInfoVC.hotel = sender as? Hotel
    }

}

// MARK: - Layout

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width - 22, height: 140)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
}
