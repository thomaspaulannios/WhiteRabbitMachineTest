//
//  WRHomeViewModel.swift
//  WhiteRabbitProducts
//
//  Created by i mac on 16/02/22.
//

import Foundation
class WRHomeViewModel{
    //Product list array
    var allProductList:[Productdetails] = []
    //Will call the model function and setting the product list.
    func createHomeProductList(homeProductsCompletion:@escaping()->Void){
        WRHomeManagerModel().createProductList { [weak self] productList in
            self?.allProductList = productList
            homeProductsCompletion()
        }
    }
}
enum WRHomeProductType:String{
    case ProductCarousel = "PRDCTCRL"
    case Product = "PRDCT"
    case Banner = "BANNER"
    var code:String{
        return self.rawValue
    }
}
