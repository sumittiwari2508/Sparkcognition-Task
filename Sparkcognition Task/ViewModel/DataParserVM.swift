//
//  DataParserVM.swift
//  Sparkcognition Task
//
//  Created by $umit on 22/08/22.
//

import Foundation
import UIKit
import SwiftyJSON

class BeerViewModel: NSObject{
    
    static let shared = BeerViewModel()
    
    func getBeerlist(completion: @escaping([BeerListModel]?,Error?) -> ()){
        let url = "https://jsonkeeper.com/b/XXFE"
    
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           
            guard  error == nil && data != nil else {
                DispatchQueue.main.async {
                    print(error?.localizedDescription ?? "")
                }
                return
            }
            
            DispatchQueue.main.async
            {
                guard let data = data else {
                    print("error in getting data")
                    return
                }
                do {
                    var bData = [BeerListModel]()
                    let json = try JSON(data: data)
                   print(json)
                        bData = json.arrayValue.map{ BeerListModel(json: $0)}
                    
                    completion(bData,nil)
                }catch {print(error.localizedDescription)}
            }
            
        }.resume()
        
        
    }
    
}

