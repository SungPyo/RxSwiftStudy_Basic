import RxSwift
import RxRelay
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Amb)
 
 # StartWith
 */
let first = BehaviorRelay<Int>(value: 100)

first.accept(0)
first.startWith(5)
    .subscribe(onNext: { ob in
        print("방출 = \(ob)")
    })
    .disposed(by: disposeBag)

first.accept(1)
first.accept(2)
first.accept(3)

/*:
 StartWith는 맨 처음 발생시킬 이벤트의 값을 넣어줄 수 있습니다.
 
 [Next](RxSwiftStudy)
 */
