import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Create)
 
 # Create
 */

var observableSwitch: Bool = false
let deferredObservable: Observable<Int> = Observable.deferred {
    if observableSwitch {
        return Observable.just(1)
    } else {
        return Observable.just(2)
    }
}

observableSwitch = true
deferredObservable
    .subscribe({ event in
        print("방출 = \(event)")
    })
    .disposed(by: disposeBag)
/*:
 Observable을 생성하는 시점을 연기하는 오퍼레이터 입니다.
 위 코드는 구독하는 시점에 observableSwitch 값을 가지고 어떤 오퍼레이터를 만들지 결정됩니다.

 [Next](Empty)
 */
