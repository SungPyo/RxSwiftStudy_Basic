//
//  DetailViewController.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/21.
//

import UIKit
import RxSwift
import Kingfisher

final class DetailViewController: UIViewController {
    @IBOutlet private weak var albumImageView: UIImageView!
    @IBOutlet private weak var playButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var prevButton: UIButton!
    
    private let disposeBag: DisposeBag = DisposeBag()
    private var viewModel: DetailViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        
        let playButtonState = playButton.rx.tap
            .map { [weak self] _ -> Bool in
                guard let self = self else { return false }
                return self.playButton.isSelected
            }
            
        // 버튼 상태 변경
        playButtonState
            .map {!$0}
            .bind(to: playButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        let input = DetailViewModelType.Input(fetch: Observable.just(()),
                                              playButton: playButton.rx.tap.asObservable(),
                                              nextButton: nextButton.rx.tap.asObservable(),
                                              prevButton: prevButton.rx.tap.asObservable())
        let output = viewModel.transform(input: input)
        
        output.currentMusic
            .subscribe(onNext: { [weak self] musicInfo in
                guard let self = self else { return }
                self.albumImageView.kf.setImage(with: musicInfo.imgUrl)
            }).disposed(by: disposeBag)
        
        //시작
        playButtonState
            .filter {$0}
            .withLatestFrom(output.currentPlayer)
            .subscribe(onNext: { $0.play() })
            .disposed(by: disposeBag)
        
        //중지
        playButtonState
            .filter {!$0}
            .withLatestFrom(output.currentPlayer)
            .subscribe(onNext: { $0.pause() })
            .disposed(by: disposeBag)
        
        //다음곡, 이전곡
        output.changePlayer
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.playButton.isSelected = false
                self.playButton.sendActions(for: .touchUpInside)
            })
            .disposed(by: disposeBag)
    }
}

extension DetailViewController: VCDependency {
    public static var storyboardName: String = "Main"
    public static var vcIdentifier: String = DetailViewController.className
    
    public func bindData(data: DetailViewModelType) {
        self.viewModel = data
    }
}

extension DetailViewController: VCStream {}
