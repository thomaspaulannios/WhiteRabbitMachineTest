//
//  WRProductCollectionViewCell.swift
//  WhiteRabbitProducts
//
//  Created by i mac on 16/02/22.
//

import UIKit

class WRProductCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "WRProductCollectionViewCell"
    
    @IBOutlet weak var productOffer: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    func bindData(product:Products){
        if let tmpUrl:URL = URL(string: product.productImageUrl ?? ""){
            self.productImage.kf.setImage(with: tmpUrl, placeholder: UIImage(systemName: "photo"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        self.productName.text = product.ProductName ?? "-"
        self.productOffer.text = product.ProductOffer ?? "-"
    }
}
