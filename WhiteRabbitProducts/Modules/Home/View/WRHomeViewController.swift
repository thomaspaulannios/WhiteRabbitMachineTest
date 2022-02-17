//
//  WRHomeViewController.swift
//  WhiteRabbitProducts
//
//  Created by i mac on 16/02/22.
//

import UIKit

class WRHomeViewController: UIViewController {
    private let viewModel:WRHomeViewModel = WRHomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadProductList()
    }
    func loadProductList(){
        viewModel.createHomeProductList {[weak self] in
            self?.reloadTable()
        }
    }
    func reloadTable(){
        
    }
}
extension WRHomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.allProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentProduct:Productdetails = self.viewModel.allProductList[indexPath.row]
        switch currentProduct.productCode{
        case WRHomeProductType.ProductCarousel.code:
            let cell:WRProductCarouselTableViewCell = tableView.dequeueReusableCell(withIdentifier: WRProductCarouselTableViewCell.reuseIdentifier, for: indexPath) as! WRProductCarouselTableViewCell
            cell.bindData(productCarousel: currentProduct.productCarousel ?? [])
            return cell
        case WRHomeProductType.Product.code:
            let cell:WRProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: WRProductTableViewCell.reuseIdentifier, for: indexPath) as! WRProductTableViewCell
            cell.bindData(productList: currentProduct.products ?? [])
            return cell
        case WRHomeProductType.Banner.code:
            let cell:WRProductBannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: WRProductBannerTableViewCell.reuseIdentifier, for: indexPath) as! WRProductBannerTableViewCell
            cell.bindData(imageUrl: currentProduct.bannerImageUrl ?? "")
            return cell
            
        default:
            return UITableViewCell()
            
        }
        
    }
    
    
}
