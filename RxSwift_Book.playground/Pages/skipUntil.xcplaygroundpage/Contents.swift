import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](SkipWhile)
 
 # SkipUntil
 */
let skipUntilObservable = PublishSubject<Int>()
let skipUntilTriggerObservable = PublishSubject<Void>()

skipUntilObservable
    .skip(until: skipUntilTriggerObservable)
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

skipUntilObservable.onNext(1)
skipUntilObservable.onNext(2)
skipUntilTriggerObservable.onNext(())
skipUntilObservable.onNext(3)
skipUntilObservable.onNext(4)
skipUntilObservable.onNext(5)

/*:
 트리거가 발생되기 이전까지 발생하는 이벤트는 모두 skip 하는 오퍼레이터 입니다.
 
 [Next](Take)
 */
