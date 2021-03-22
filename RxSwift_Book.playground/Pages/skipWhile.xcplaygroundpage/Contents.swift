import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Skip)
 
 # SkipWhile
 */
let skipWhileObservable: Observable = Observable.from([1,2,3,4,5])

skipWhileObservable
    .skip(while: {$0 == 1 || $0 == 2})
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

/*:
 전달된 이벤트가 true인 경우 skip합니다.
 하지만 false가 나오는 순간 그 다음부터는 모두 다 방출합니다.
 
 [Next](SkipUntil)
 */
