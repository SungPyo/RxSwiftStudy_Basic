import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Concat)
 
 # Amb
 */
let first = PublishSubject<Int>()
let second = PublishSubject<Int>()

let concatObservable = Observable.amb([first,second])

concatObservable
    .subscribe(onNext: { ob in
        print("방출 = \(ob)")
    })
    .disposed(by: disposeBag)

second.onNext(5)
first.onNext(1)
first.onNext(2)
second.onNext(6)
first.onNext(3)
second.onNext(7)
second.onNext(8)

/*:
 Amb는 맨 처음 발생한 Observable의 이벤트만 사용합니다.
 
 [Next](StartWith)
 */
