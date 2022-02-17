//
//  WRProductCarouselCollectionViewCell.swift
//  WhiteRabbitProducts
//
//  Created by i mac on 16/02/22.
//

import UIKit
import Kingfisher
class WRProductCarouselCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "WRProductCarouselCollectionViewCell"
    
    @IBOutlet weak var carouselImage: UIImageView!
    func bindData(imageUrl:String){
        if let tmpUrl:URL = URL(string: imageUrl){
            self.carouselImage.kf.setImage(with: tmpUrl, placeholder: UIImage(systemName: "photo"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
