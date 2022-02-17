//
//  WRProductCarouselTableViewCell.swift
//  WhiteRabbitProducts
//
//  Created by i mac on 16/02/22.
//

import UIKit

class WRProductCarouselTableViewCell: UITableViewCell {
    static let reuseIdentifier = "WRProductCarouselTableViewCell"
    
    var productCarousel:[ProductCarousel] = []
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    @IBOutlet weak var pageController: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func bindData(productCarousel:[ProductCarousel]){
        self.productCarousel = productCarousel
        self.carouselCollectionView.delegate = self
        self.carouselCollectionView.dataSource = self
        self.carouselCollectionView.reloadData()
        self.pageController.numberOfPages = self.productCarousel.count
        self.pageController.currentPage = 0
    }

}
extension WRProductCarouselTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productCarousel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.pageController.currentPage = indexPath.row
        let currentItem:ProductCarousel = self.productCarousel[indexPath.row]
        let cell:WRProductCarouselCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: WRProductCarouselCollectionViewCell.reuseIdentifier, for: indexPath) as! WRProductCarouselCollectionViewCell
        cell.bindData(imageUrl: currentItem.imageUrl ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return(CGSize(width: carouselCollectionView.frame.width, height: carouselCollectionView.frame.height))
    }
    
}
