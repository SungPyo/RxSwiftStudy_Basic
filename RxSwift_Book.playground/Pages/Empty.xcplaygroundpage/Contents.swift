import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Deferred)
 
 # Empty
 */

let emptyObservable: Observable<Int> = Observable.empty()

emptyObservable
    .subscribe({ event in
        print("방출 = \(event)")
    })
    .disposed(by: disposeBag)
/*:
 empty는 비어있는 시퀀스를 '방출' 하는 오퍼레이터입니다. completed를 방출합니다.

 [Next](Never)
 */
