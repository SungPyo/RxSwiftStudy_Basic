//
//  APIService.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/20.
//

import Foundation
import RxSwift

let apiError = NSError(domain: "아몰랑에러", code: 0, userInfo: nil)

protocol APIService {
    associatedtype Response
    var path: String { get }
    func parse(_: [String: Any]) -> Response
}

extension APIService {
    func request() -> Observable<Self.Response> {
        Observable<Self.Response>.create { (observer: AnyObserver<Response>) -> Disposable in
            let url = URL(string: path)!
            let req = URLRequest(url: url)
            let task: URLSessionDataTask = URLSession.shared.dataTask(with: req) { (data, response, error) in
                guard let res = response as? HTTPURLResponse else {
                    return observer.onError(apiError)
                }
                let httpCode = HTTPCode.by(res.statusCode)
                if httpCode.isOK {
//                    observer.onError(apiError)
                    data.flatMap { try? JSONSerialization.jsonObject(with: $0, options: .allowFragments) as? [String: Any] }
                        .flatMap { parse($0) }
                        .flatMap { observer.onNext($0) }
                } else {
                    observer.onError(apiError)
                }
            }
            task.resume()
            return Disposables.create()
        }.do(onError: { error in
            print("error = \(error)")
        }).catch { error in
            return .empty()
        }
    }
}
