//
//  DetailViewModel.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/22.
//

import Foundation
import AVKit
import RxSwift

class DetailViewModelType: ViewModelType {
    var output: Output!
    var dependency: Dependency
    
    public struct Dependency {
        let indexPath: IndexPath
        let musicInfos: [MusicInfo]
    }
    
    struct Input {
        let fetch: Observable<Void>
        let playButton: Observable<Void>
        let nextButton: Observable<Void>
        let prevButton: Observable<Void>
        let changedVolume: Observable<Float>
    }
    
    struct Output {
        let currentMusic: Observable<MusicInfo>
        let currentPlayer: Observable<AVPlayer>
        let changePlayer: Observable<()>
        let seekValue: Observable<Float>
        let currentVolume: Observable<Float>
        let durationValue: Observable<Float>
    }
    
    public init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    func transform(input: Input) -> Output {
        return output
    }
}

final class DetailViewModel: DetailViewModelType {
    private let avPlayer: AVPlayer = {
        let player = AVPlayer()
        return player
    }()
    private let currentIndex: BehaviorSubject<Int> = BehaviorSubject<Int>(value: .zero)
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func transform(input: Input) -> Output {
        
        let fetchMusic = input.fetch
            .compactMap { [weak self] _ -> MusicInfo? in
                guard let self = self else { return nil }
                let currentMusic = self.dependency.musicInfos[self.dependency.indexPath.row]
                self.currentIndex.onNext(self.dependency.indexPath.row)
                return currentMusic
            }
        
        let currentPlayer = input.playButton
            .withLatestFrom(currentIndex)
            .compactMap { [weak self] index -> AVPlayer? in
                guard let self = self else { return nil }
                let musicInfo = self.dependency.musicInfos[index]
                let playerItem = AVPlayerItem(url: musicInfo.previewUrl)
                self.avPlayer.replaceCurrentItem(with: playerItem)
                return self.avPlayer
            }
        
        let seekValue = Observable<Int>
            .interval(.milliseconds(500), scheduler: MainScheduler.instance)
            .map { [weak self] _ -> Float in
                guard let self = self else { return .zero }
                return Float(CMTimeGetSeconds(self.avPlayer.currentTime()) / CMTimeGetSeconds(self.avPlayer.currentItem?.duration ?? .zero))
            }
        
        input.changedVolume
            .bind(to: self.avPlayer.rx.volume)
            .disposed(by: disposeBag)

        let nextPlayer = input.nextButton
            .withLatestFrom(currentIndex)
            .compactMap { [weak self] index -> Int? in
                guard let self = self else { return nil }
                let currentIndex = self.calcIndex(index: index + 1)
                return currentIndex
            }
            
        let prevPlayer = input.prevButton
            .withLatestFrom(currentIndex)
            .compactMap { [weak self] index -> Int? in
                guard let self = self else { return nil }
                let currentIndex = self.calcIndex(index: index - 1)
                return currentIndex
            }
        
        let changeMusic = Observable.merge(nextPlayer, prevPlayer)
            .compactMap { [weak self] index -> MusicInfo? in
                guard let self = self else { return nil }
                let currentMusic = self.dependency.musicInfos[index]
                return currentMusic
            }
        
        let currentMusic = Observable.merge(fetchMusic, changeMusic)
            
        let changePlayer = Observable.merge(nextPlayer, prevPlayer)
            .do(onNext: { [weak self] index in
                guard let self = self else { return }
                self.currentIndex.onNext(index)
                self.avPlayer.pause()
            })
            .map { _ in}
        
        let currentVolume = currentPlayer
            .map {$0.volume}
        
        let durationValue = currentMusic
            .compactMap { [weak self] _ -> CMTime? in
                self?.avPlayer.currentItem?.duration
            }
            .map { Float(CMTimeGetSeconds($0)) }
        
//        let durationValue = currentPlayer
//            .compactMap { $0.currentItem?.duration }
//            .map { Float(CMTimeGetSeconds($0)) }
        
        return Output(currentMusic: currentMusic,
                      currentPlayer: currentPlayer,
                      changePlayer: changePlayer,
                      seekValue: seekValue,
                      currentVolume: currentVolume,
                      durationValue: durationValue)
    }
    
    private func calcIndex(index: Int) -> Int {
        guard index >= .zero else { return Int(dependency.musicInfos.indices.last!)}
        return dependency.musicInfos.indices ~= index ? index : .zero
    }
}


