//
//  Restaurants.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/13.
//

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class RestaurantService: RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { observer -> Disposable in
            
//            let task = URLSession.shared.dataTask(with: URL(string: "url-here")!) { data, _, _ in
//
                guard let path = Bundle.init(for: RestaurantService.self).path(forResource: "restaurants", ofType: "json") else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return Disposables.create()
//                    return //Disposables.create()
                }
                
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                    observer.onNext(restaurants)
                } catch {
                    observer.onError(error)
                }
//            }
//            task.resume()
            return Disposables.create {
//                task.cancel()
            }
        }
    }
}

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}

