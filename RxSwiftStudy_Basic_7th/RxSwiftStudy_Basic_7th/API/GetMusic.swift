//
//  GetMusic.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/20.
//

import Foundation

struct GetMusic {
    let searchText: String
}

extension GetMusic: APIService {
    var path: String { return "https://itunes.apple.com/search?term=\(searchText))&entity=song&country=KR" }
    func parse(_ json: [String : Any]) -> [MusicInfo] {
        let result = json["results"] as? [[String: Any]]
        guard let musicInfos = result?.compactMap(MusicInfo.init) else { return [] }
        return musicInfos
    }
}
