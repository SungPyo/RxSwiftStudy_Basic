//
//  MainViewController.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/08.
//

import UIKit
import RxSwift
import RxCocoa

public final class MainViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private let disposeBag: DisposeBag = DisposeBag()
    private var viewModel: MainViewModelType!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: MusicCell.className,
                                 bundle: Bundle(for: MusicCell.self)),
                           forCellReuseIdentifier: "Cell")
        bind()
    }
    
    private func bind() {
        let input = MainViewModelType.Input(fetch: searchBar.rx.text.asObservable())
        let output = viewModel.transform(input: input)

        tableView.rx.modelSelected(MusicInfo.self)
            .flatMapLatest { [weak self] _ -> Observable<Void> in
                guard let self = self else { return .empty() }
                return DetailViewController.createInstance(data: ())
                    .present(withPresenter: self)
            }
            .subscribe(onNext: {
                print("끝?")
            })
            .disposed(by: disposeBag)

        output.model.bind(to: tableView.rx.items)({ (tv, row, music) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "Cell") as! MusicCell
            cell.configureCell(music: music)
            return cell
        })
        .disposed(by: disposeBag)
    }
}

extension MainViewController: VCDependency {
    public static var storyboardName: String = "Main"
    public static var vcIdentifier: String = MainViewController.className
    
    public func bindData(data: MainViewModelType) {
        self.viewModel = data
    }
}

extension MainViewController: VCStream {}
