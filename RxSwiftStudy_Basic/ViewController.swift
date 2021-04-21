//
//  ViewController.swift
//  RxSwiftStudy_Basic
//
//  Created by Pyo Cho on 2021/03/02.
//

import UIKit
import RxSwift
import RxCocoa
import RxSwiftStudy_Basic_7th

extension NSObject {
    public class var className: String {
        return String(describing: self)
    }

    public var className: String {
        return type(of: self).className
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var btn: UIButton!
    
    private let disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bind()
    }
    
    private func bind() {
        btn.rx.tap
            .flatMapLatest { [weak self] _ -> Observable<Void> in
                guard let self = self else { return .never() }
                let viewModel: MainViewModelType = MainViewModel(dependency: MainViewModelType.Dependency())
                return MainViewController.createInstance(data: viewModel)
                    .present(withPresenter: self)
            }
            .subscribe(onNext: { _ in})
            .disposed(by: disposeBag)
    }
}

