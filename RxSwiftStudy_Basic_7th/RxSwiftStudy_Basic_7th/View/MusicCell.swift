//
//  MusicCell.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/20.
//

import UIKit
import Kingfisher

class MusicCell: UITableViewCell {
    
    @IBOutlet private weak var albumImageView: UIImageView!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var trackLabel: UILabel!

    func configureCell(music: MusicInfo) {
        albumImageView.kf.setImage(with: music.imgUrl)
        artistLabel.text = music.artistName
        trackLabel.text = music.trackName
    }
}
