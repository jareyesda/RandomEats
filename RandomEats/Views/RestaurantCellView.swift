//
//  RestaurantCellView.swift
//  RandomEats
//
//  Created by Juan Reyes on 7/26/21.
//

import SwiftUI

struct RestaurantCellView: View {
    
    let imageURL: String
    let name: String
    let rating: Double
    let price: String
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 25.0)
            .fill(Color.clear)
            .frame(height: 175)
            .overlay(
                HStack(spacing:0) {
                    RemoteImage(url: imageURL)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 5)
                        )
                    VStack {
                        Text(name)
                            .bold()
                            .frame(width: 200, height: 75)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 5)
                            )
                        HStack(spacing: 0) {
                            Text("\(rating)")
                                .frame(width: 100, height: 75)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.black, lineWidth: 5)
                                )
                            Text("\(price)")
                                .frame(width: 100, height: 75)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.black, lineWidth: 5)
                                )
                        }
                    }
                    .padding()
                }
            )
    }
    
}


struct RestaurantCellView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCellView(imageURL: "poop", name: "poop", rating: 2.0, price: "2")
    }
}
