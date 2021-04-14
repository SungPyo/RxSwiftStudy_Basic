import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Empty)
 
 # Never
 */

let neverObservable: Observable<Int> = Observable.never()

neverObservable
    .subscribe({ event in
        print("방출 = \(event)")
    })
    .disposed(by: disposeBag)
/*:
 never는 empty와 다르게 이벤트를 방출조차 하지 않는 오퍼레이터 입니다.

 [Next](Error)
 */
