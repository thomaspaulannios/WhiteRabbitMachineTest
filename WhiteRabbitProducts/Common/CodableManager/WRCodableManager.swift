//
//  WRCodableManager.swift
//  WhiteRabbitProducts
//
//  Created by i mac on 16/02/22.
//

import Foundation
//Convert Data to given Codable model
struct WRCodableManager{
    func createCodableModel<responceType:Codable>(inputData:Data)->responceType?{
        if let codableObject = try? JSONDecoder().decode(responceType.self, from: inputData){
            return codableObject
        }
        else{
            return nil
        }
        
    }
}




