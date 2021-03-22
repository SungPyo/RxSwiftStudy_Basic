import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Filter)
 
 # First
 */
let firstObservable: Observable = Observable.from([1,2,3,4,5])

firstObservable
    .first()
    .subscribe(onSuccess: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

/*:
 말 그대로 첫번째 이벤트를 방출합니다.(Single!)
 항목이 없는경우 nil을 방출합니다.
 
 [Next](IgnoreElements)
 */
