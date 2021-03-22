import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Throttle)
 
 # DistinctUntilChanged
 */
let distinctUntilChangedObservable: Observable = Observable.from([1,2,2,3,2])

distinctUntilChangedObservable
    .distinctUntilChanged()
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

/*:
 이전 이벤트와 비교해서 다르면 이벤트를 방출합니다.
 
 [Next](ElementAt)
 */
