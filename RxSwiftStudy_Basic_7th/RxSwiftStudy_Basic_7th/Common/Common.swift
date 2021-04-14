//
//  Common.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/09.
//

import UIKit
import RxSwift

extension NSObject {
    public class var className: String {
        return String(describing: self)
    }

    public var className: String {
        return type(of: self).className
    }
}

public protocol VCDependency: AnyObject {
    associatedtype Dependency
    static var storyboardName: String { get }
    static var vcIdentifier: String { get }
    func bindData(data: Dependency)
}

extension VCDependency {
    public static func createInstance(data: Self.Dependency) -> Self {
        let bundle = Bundle(for: Self.self)
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: self.vcIdentifier) as! Self
        vc.bindData(data: data)
        return vc
    }
}

public protocol VCStream where Self: UIViewController {
    associatedtype T
}

extension VCStream {
    public func present(withPresenter presenter: UIViewController, style: UIModalPresentationStyle = .fullScreen) -> Observable<Void> {
        return Observable<Void>.create { [unowned self] observer -> Disposable in
            self.modalPresentationStyle = style
            presenter.present(self, animated: true) {
                observer.onNext(())
            }
            return Disposables.create { [weak self] in
                guard let self = self else { return }
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
