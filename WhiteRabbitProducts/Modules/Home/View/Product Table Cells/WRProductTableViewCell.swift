//
//  WRProductTableViewCell.swift
//  WhiteRabbitProducts
//
//  Created by i mac on 16/02/22.
//

import UIKit

class WRProductTableViewCell: UITableViewCell {
    static let reuseIdentifier = "WRProductTableViewCell"
    var productList:[Products] = []
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(productList:[Products]){
        self.productList = productList
        self.productCollectionView.delegate = self
        self.productCollectionView.dataSource = self
        self.productCollectionView.reloadData()
    }
}
extension WRProductTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentItem:Products = self.productList[indexPath.row]
        let cell:WRProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: WRProductCollectionViewCell.reuseIdentifier, for: indexPath) as! WRProductCollectionViewCell
        cell.bindData(product: currentItem)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return(CGSize(width: productCollectionView.frame.width/2, height: productCollectionView.frame.height/2))
    }
    
}
