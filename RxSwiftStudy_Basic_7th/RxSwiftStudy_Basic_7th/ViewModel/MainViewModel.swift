//
//  MainViewModel.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/09.
//

/*:
 https://www.youtube.com/watch?v=Dentp0JUbyI
 */

import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    associatedtype Dependency
    var dependency: Dependency { get }
    var output: Output! { get }
    func transform(input: Input) -> Output
}

public class MainViewModelType: ViewModelType {
    var output: Output!
    var dependency: Dependency
    
    public struct Dependency {
        public init() {}
    }
    
    struct Input {}
    struct Output {}
    
    public init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    func transform(input: Input) -> Output {
        return output
    }
}

public class MainViewModel: MainViewModelType {
    
    override func transform(input: Input) -> Output {
        return output
    }
}

struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}

