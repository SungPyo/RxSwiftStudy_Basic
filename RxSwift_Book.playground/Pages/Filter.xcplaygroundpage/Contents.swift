import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](ElementAt)
 
 # Filter
 */
let filterObservable: Observable = Observable.from([0,1,2,3,4])

filterObservable
    .filter {$0%2 == 0}
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

/*:
 특정 조건에 맞는 이벤트만 발생시키는 오퍼레이터 입니다. Swift의 filter와 같다고 생각하시면 될것 같아요.
 
 [Next](First)
 */
