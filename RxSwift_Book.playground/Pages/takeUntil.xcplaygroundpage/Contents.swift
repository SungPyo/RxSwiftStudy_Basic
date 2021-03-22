import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](TakeWhile)
 
 # TakeUntil
 */
let takeUntilObservable = PublishSubject<Int>()
let takeUntilTriggerObservable = PublishSubject<Void>()

takeUntilObservable
    .take(until: takeUntilTriggerObservable)
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

takeUntilObservable.onNext(1)
takeUntilObservable.onNext(2)
takeUntilTriggerObservable.onNext(())
takeUntilObservable.onNext(3)
takeUntilObservable.onNext(4)
takeUntilObservable.onNext(5)

/*:
 트리거가 발생되기 이전까지 발생하는 이벤트만 take 하는 오퍼레이터 입니다.
 
 [Next](CombineLatest)
 */
