import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Merge)
 
 # SwitchLatest
 */
let first = PublishSubject<Int>()
let second = PublishSubject<Int>()
let switchLatestObservable = PublishSubject<Observable<Int>>()

switchLatestObservable.switchLatest()
    .subscribe(onNext: { number in
        print("number = \(number)")
    }).disposed(by: disposeBag)

switchLatestObservable.onNext(first)
first.onNext(1) // 1
first.onNext(2) // 2
second.onNext(3) //무시
second.onNext(4) //무시
switchLatestObservable.onNext(second)
second.onNext(5) // 5
second.onNext(6) // 6

/*:
 switchLatestObservable는 Observable을 이벤트로 가지는 Observable이 가장 최근에 전달된 Observable에 대해서만 이벤트를 방출하는 역할을 합니다.
 
 [Next](Zip)
 */
