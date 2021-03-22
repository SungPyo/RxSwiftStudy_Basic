import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](DistinctUntilChanged)
 
 # ElementAt
 */
let elementAtObservable: Observable = Observable.from([0,1,2,3,4])

elementAtObservable
    .element(at: 3)
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

/*:
 방출되는 이벤트 중에 n번째 이벤트만 받고싶을때 사용하는 오퍼레이터 입니다.
 방출되는 이벤트보다 더 큰 숫자를 입력하면 'Argument out of range.' 에러!
 
 [Next](Filter)
 */
