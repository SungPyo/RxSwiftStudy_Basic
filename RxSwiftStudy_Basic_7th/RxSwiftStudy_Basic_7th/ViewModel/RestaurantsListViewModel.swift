//
//  RestaurantsListViewModel.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/13.
//

import Foundation
import RxSwift

final class RestaurantsListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map( { $0.map {
            RestaurantViewModel(restaurant: $0) } } )
    }
}
