import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Take)
 
 # TakeWhile
 */
let takeWhileObservable: Observable = Observable.from([1,2,3,4,5])

takeWhileObservable
    .take(while: {$0 == 1 || $0 == 2})
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

/*:
 skipWhile과 같습니다. 조건에 맞는 이벤트만 방출합니다.
 하지만 false가 나오는 순간 그 다음부터는 모두 다 무시합니다.
 
 [Next](TakeUntil)
 */
