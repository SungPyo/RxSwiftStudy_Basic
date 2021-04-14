import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Debounce)
 
 # Throttle
 */
let throttleObservable: Observable<Int> = Observable.create { observer -> Disposable in
    let numbers = [1,2,3,4,5]
    numbers.forEach { number in
        DispatchQueue(label: "Debounce").asyncAfter(deadline: DispatchTime.now() + Double(number)) {
            print("들어온 이벤트! = \(number) \(Date())")
            observer.onNext(number)
        }
    }
    return Disposables.create()
}.share()

throttleObservable
    .throttle(.milliseconds(3800),
              scheduler: MainScheduler.asyncInstance)
    .subscribe(onNext: { number in
        print("방출 = \(number) \(Date())")
    })
    .disposed(by: disposeBag)

/*:
 Throttle은 지정한 시간이 되면 가장 최근에 발생한 이벤트를 방출합니다.
 Debounce와 헷갈릴 수 있는데, 예제를 실행해 보시면 단번에 이해가 가능할 겁니다!
 
 [Next](DistinctUntilChanged)
 */
