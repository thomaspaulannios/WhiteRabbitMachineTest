//
//  WRProductBannerTableViewCell.swift
//  WhiteRabbitProducts
//
//  Created by i mac on 16/02/22.
//

import UIKit
import Kingfisher
class WRProductBannerTableViewCell: UITableViewCell {
    static let reuseIdentifier = "WRProductBannerTableViewCell"
    
    @IBOutlet weak var bannerImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(imageUrl:String){
        if let tmpUrl:URL = URL(string: imageUrl){
            self.bannerImageView.kf.setImage(with: tmpUrl, placeholder: UIImage(systemName: "photo"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }

}
