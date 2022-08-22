//
//  BeerListModel.swift
//  Sparkcognition Task
//
//  Created by $umit on 22/08/22.
//

import Foundation
import SwiftyJSON

struct BeerListModel{
    var  name :String?
    var style : String?
    var  abv : String?
    var ounces : String?
    var id : String?
    
    init(json:JSON){
        name = json["name"].stringValue
        style = json["style"].stringValue
        abv = json["abv"].stringValue
        ounces = json["ounces"].stringValue
        id = json["id"].stringValue
    }
}
