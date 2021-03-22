import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](WithLatestFrom)
 
 # Merge
 */
let first = PublishSubject<Int>()
let second = PublishSubject<Int>()
let mergeObservable = Observable.merge(first, second)

mergeObservable
    .subscribe(onNext: { ob in
        print("방출 = \(ob)")
    })
    .disposed(by: disposeBag)

first.onNext(1)
first.onNext(2)
second.onNext(2)
second.onNext(3)
second.onNext(4)

/*:
 CombineLatest와 매우 비슷합니다.
 차이는 second 또는 first가 들어오기 이전에도 각각의 이벤트를 방출합니다.
 
 [Next](SwitchLatest)
 */
