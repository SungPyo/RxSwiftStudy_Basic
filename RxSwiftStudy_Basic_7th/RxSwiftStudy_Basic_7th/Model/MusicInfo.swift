//
//  MusicList.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/20.
//

import Foundation

struct MusicInfo {
    let artistName: String?
    let trackName : String?
    let imgUrl    : URL?
    
    init(_ json: [String: Any]) {
        artistName = json["artistName"] as? String
        trackName = json["trackName"] as? String
        imgUrl = (json["artworkUrl100"] as? String).flatMap {URL(string: $0)}
    }
}
