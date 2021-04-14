import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](IgnoreElements)
 
 # Sample
 */
let sampleObservable: Observable = Observable.from([1,2,3,4,5])
let sampleTriggerObservable: Observable = Observable.from([(),(),(),()])

sampleObservable
    .sample(sampleTriggerObservable)
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

/*:
 트리거가 발생하면 그에 맞는 이벤트를 발생시키는 오퍼레이터 입니다.
 completed 에도 반응하며, 에러가 발생한 경우에는 반응하지 않습니다.
 
 [Next](Skip)
 */
