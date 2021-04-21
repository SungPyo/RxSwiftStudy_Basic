//
//  DetailViewController.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/21.
//

import UIKit

final class DetailViewController: UIViewController {
    override func viewDidLoad() {}
}

extension DetailViewController: VCDependency {
    public static var storyboardName: String = "Main"
    public static var vcIdentifier: String = DetailViewController.className
    
    public func bindData(data: Void) {}
}

extension DetailViewController: VCStream {}
