//
//  MainViewController.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/08.
//

import UIKit
import RxSwift
import RxCocoa

public class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let disposeBag: DisposeBag = DisposeBag()
    private let listViewModel: RestaurantsListViewModel = RestaurantsListViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        listViewModel
            .fetchRestaurantViewModels()
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
                cell.textLabel?.text = viewModel.displayText
            }.disposed(by: disposeBag)
    }
}

extension MainViewController: VCDependency {
    public static var storyboardName: String = "Main"
    public static var vcIdentifier: String = MainViewController.className
    
    private struct AssociatedKey {
//        static var str: String!
        static var viewModel: MainViewModelType!
    }
    
//    private var str: String! {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKey.str) as? String
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedKey.str, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
//        }
//    }
    private var viewModel: MainViewModelType! {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.viewModel) as? MainViewModelType
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.viewModel, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    public func bindData(data: MainViewModelType) {
        self.viewModel = data
    }
}

extension MainViewController: VCStream {
    public typealias T = Void
}
