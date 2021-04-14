import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Error)
 
 # Interval
 */

let error = NSError(domain: "NSError", code: 0, userInfo: nil)
let errorObservable: Observable<Int> = Observable.interval(.milliseconds(1000),
                                                           scheduler: MainScheduler.asyncInstance)

errorObservable
    .subscribe({ event in
        print("방출 = \(event)")
    })
    .disposed(by: disposeBag)
/*:
 Interval은 지정한 시간 간격으로 정수 이벤트를 반환하는 오퍼레이터 입니다.

 [Next](Range)
 */
