import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](BehaviorRelay)
 
 # Create
 */
let createObservable: Observable<Int> = Observable.create { observer -> Disposable in
    observer.onNext(1)
    observer.onNext(2)
    observer.onCompleted()
    return Disposables.create()
}

createObservable
    .subscribe({ event in
        print("방출 = \(event)")
    })
    .disposed(by: disposeBag)
/*:
 Observable을 생성하는 가장 기본적인 오퍼레이터 입니다.

 [Next](Deferred)
 */
