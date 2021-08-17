//
//  ViewAllRestaurantsView.swift
//  RandomEats
//
//  Created by Juan Reyes on 7/26/21.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @ObservedObject var locationManager = LocationManager()
    
    var userLatitude: String {
            return "\(locationManager.lastLocation?.coordinate.latitude ?? 28.087903)"
        }
        
        var userLongitude: String {
            return "\(locationManager.lastLocation?.coordinate.longitude ?? -82.510820)"
        }
    
    var body: some View {
        
        let baseURL = "https://api.yelp.com/v3/businesses/search?latitude=28.087903&longitude=-82.510820&radius=40000"
        
        NavigationView {
            List(networkManager.businesses) { business in
                NavigationLink(
                    destination: RestaurantDetailView(),
                    label: {
                        RestaurantCellView(
                            imageURL: business.imageURL,
                            name: business.name,
                            rating: business.rating,
                            price: business.price.rawValue
                        )
                    })
            }
            .navigationBarTitle("Random Eats")
            .foregroundColor(.black)
        }
        .onAppear(perform: {
            networkManager.fetchData(baseURL: baseURL)
            print(userLatitude)
            print(userLongitude)
        })
    }
}

struct ViewAllRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
