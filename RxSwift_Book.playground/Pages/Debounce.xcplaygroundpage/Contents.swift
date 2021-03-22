import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](BehaviorRelay)
 
 # Debounce
 */
let debounceObservable: Observable<Int> = Observable.create { observer -> Disposable in
    let numbers = [1,2,3,4,5]
    numbers.forEach { number in
        DispatchQueue(label: "Debounce")
            .asyncAfter(deadline: DispatchTime.now() + Double(number)) {
                print("들어온 이벤트! = \(number)") //1초마다 들어오는 이벤트
                observer.onNext(number)
            }
    }
    return Disposables.create()
}

debounceObservable
    .debounce(.milliseconds(2000),
              scheduler: MainScheduler.asyncInstance)
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)
/*:
 Debounce는 일정시간 이후의 시간중 가장 최근의 이벤트만 방출합니다.
 쉽게말해 이벤트가 들어와도 디바운스만큼 지정한 시간이 지나야 방출한다는거죠!
 
 [Next](Throttle)
 */
