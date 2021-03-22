import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](SkipUntil)
 
 # Take
 */
let takeWhileObservable: Observable = Observable.from([1,2,3,4,5])

takeWhileObservable
    .take(2)
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

/*:
 전달되는 이벤트중 take의 갯수만큼만 방출합니다.
 
 [Next](TakeWhile)
 */
