//
//  WRHomeManagerModel.swift
//  WhiteRabbitProducts
//
//  Created by i mac on 16/02/22.
//

import Foundation
struct WRHomeManagerModel {
    //Create the product list from Json
    func createProductList(productsCompletion:@escaping(_ productList:[Productdetails])->Void){
        if let productsData:Data = self.getProductsData(){
            productsCompletion([])
            if let productDetails:WRHomeProductModel = WRCodableManager().createCodableModel(inputData: productsData){
                productsCompletion(productDetails.productdetails ?? [])
            }
            else{
                productsCompletion([])
            }
        }
        else{
            productsCompletion([])
        }
        
    }
    //Getting data from json path
    func getProductsData()->Data?{
        if let productJsonPath = Bundle.main.path(forResource: "ProductList", ofType: "json")
        {
            let productJsonUrl:URL = URL(fileURLWithPath: productJsonPath)
            if let productJsonData:Data = try? Data(contentsOf: productJsonUrl){
                return productJsonData
            }
            else{
                return nil
            }
        }
        else{
            return nil
        }
    }
}
struct WRHomeProductModel : Codable {
    let productdetails : [Productdetails]?

    enum CodingKeys: String, CodingKey {

        case productdetails = "Productdetails"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productdetails = try values.decodeIfPresent([Productdetails].self, forKey: .productdetails)
    }

}
struct ProductCarousel : Codable {
    let id : Int?
    let imageUrl : String?

    enum CodingKeys: String, CodingKey {

        case id = "Id"
        case imageUrl = "ImageUrl"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
    }

}
struct Productdetails : Codable {
    let productDetailsId : Int?
    let productCode : String?
    let products : [Products]?
    let bannerImageUrl : String?
    let productCarousel : [ProductCarousel]?

    enum CodingKeys: String, CodingKey {

        case productDetailsId = "ProductDetailsId"
        case productCode = "ProductCode"
        case products = "Products"
        case bannerImageUrl = "BannerImageUrl"
        case productCarousel = "ProductCarousel"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productDetailsId = try values.decodeIfPresent(Int.self, forKey: .productDetailsId)
        productCode = try values.decodeIfPresent(String.self, forKey: .productCode)
        products = try values.decodeIfPresent([Products].self, forKey: .products)
        bannerImageUrl = try values.decodeIfPresent(String.self, forKey: .bannerImageUrl)
        productCarousel = try values.decodeIfPresent([ProductCarousel].self, forKey: .productCarousel)
    }

}
struct Products : Codable {
    let productId : Int?
    let productImageUrl : String?
    let ProductName : String?
    let ProductOffer : String?
    enum CodingKeys: String, CodingKey {

        case productId = "ProductId"
        case productImageUrl = "ProductImageUrl"
        case ProductName = "ProductName"
        case ProductOffer = "ProductOffer"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        productImageUrl = try values.decodeIfPresent(String.self, forKey: .productImageUrl)
        ProductName = try values.decodeIfPresent(String.self, forKey: .ProductName)
        ProductOffer = try values.decodeIfPresent(String.self, forKey: .ProductOffer)
    }

}
