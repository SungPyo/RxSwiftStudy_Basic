//
//  HTTPCode.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/20.
//

import Foundation

enum HTTPCode {
    case success
    case fail
    
    public static func by(_ statusCode: Int) -> HTTPCode {
        switch statusCode {
        case 200 ..< 400:
            return .success
        default:
            return .fail
        }
    }
    
    var isOK: Bool {
        return self == .success
    }
}
