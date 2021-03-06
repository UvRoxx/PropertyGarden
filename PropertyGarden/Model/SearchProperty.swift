//
//  SearchProperty.swift
//  PropertyGarden
//
//  Created by UTKARSH VARMA on 2021-03-06.
//

import Foundation

protocol PropertyInfoDelegate {
    func loadInfo(listingInfo:[Listing])
}
struct SearchProperty{
    var delegate:PropertyInfoDelegate?

    func startSearch(_ cityName:String){
        let url = "https://property-garden-api.herokuapp.com/findrentals/"
        let api_key = "odGzGNA49n86s7sQkKImNpoYru503ymO"
        let endpoint = URL(string: url+cityName+"/1/"+api_key)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: endpoint!) { (data, response, error) in
            if let e = error{
                print(e.localizedDescription)
                return
            }
            if let safeData=data{
              
                if let info = parseJSON(data: safeData){
                
                        delegate?.loadInfo(listingInfo: info)
                    
                }
                
            }
        }
        task.resume()
    }
    func parseJSON(data:Data)->[Listing]?{
        let decoder = JSONDecoder()
        do{
            let finalData = try decoder.decode([Listing].self, from: data)
            return finalData
        }catch{
            print(error.localizedDescription)
            return nil
        }
        
    }
    
}
