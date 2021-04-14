import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Never)
 
 # Error
 */

let error = NSError(domain: "NSError", code: 0, userInfo: nil)
let errorObservable: Observable<Int> = Observable.error(error)

errorObservable
    .subscribe({ event in
        print("방출 = \(event)")
    })
    .disposed(by: disposeBag)
/*:
 Error는 error를 방출하는 오퍼레이터 입니다.

 [Next](Interval)
 */
