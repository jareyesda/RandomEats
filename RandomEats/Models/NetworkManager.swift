//
//  NetworkManager.swift
//  RandomEats
//
//  Created by Juan Reyes on 7/24/21.
//

import Foundation
import CoreLocation

class NetworkManager: ObservableObject {
    let apikey = ""
    
    @Published var businesses = [Business]()
    
    func fetchData(baseURL: String) {
        
        let url = URL(string: baseURL)
        
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let jsonData = data {
                    do {
                        let results = try? decoder.decode(Businesses.self, from: jsonData)
                        DispatchQueue.main.async {
                            self.businesses = results!.businesses
                        }
                    }
                }
            }
        }.resume()
    }
    
}
