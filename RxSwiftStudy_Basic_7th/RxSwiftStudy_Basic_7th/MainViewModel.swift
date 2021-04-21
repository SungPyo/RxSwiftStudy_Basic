//
//  MainViewModel.swift
//  RxSwiftStudy_Basic_7th
//
//  Created by Pyo Cho on 2021/04/09.
//

/*:
 https://www.youtube.com/watch?v=Dentp0JUbyI
 */

import RxSwift

public class MainViewModelType: ViewModelType {
    var output: Output!
    var dependency: Dependency
    
    public struct Dependency {
        public init() {}
    }
    
    struct Input {
        let fetch: Observable<String?>
    }
    
    struct Output {
        let model: Observable<[MusicInfo]>
    }
    
    public init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    func transform(input: Input) -> Output {
        return output
    }
}

public final class MainViewModel: MainViewModelType {
    
    override func transform(input: Input) -> Output {
        let model = input.fetch
            .flatMap{ Observable.from(optional: $0) }
            .filter{ !$0.isEmpty }
            .debounce(.milliseconds(1000),
                      scheduler: MainScheduler.asyncInstance)
            .flatMapLatest { [weak self] string -> Observable<[MusicInfo]> in
                guard let self = self else { return .empty() }
                return self.fetch(string: self.urlEncoded(string: string))
            }
        let output = Output(model: model)
        return output
    }
    
    private func fetch(string: String) -> Observable<[MusicInfo]> {
        return GetMusic(searchText: string)
            .request()
    }
    
    private func urlEncoded(string: String?) -> String {
        guard let escapedString: String = string?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return "" }
        return escapedString
    }
}

