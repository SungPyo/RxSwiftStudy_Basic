import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](TakeUntil)
 
 # CombineLatest
 */
let first = PublishSubject<Int>()
let second = PublishSubject<Int>()
let combineLatestObservable = Observable.combineLatest(first, second)

combineLatestObservable
    .subscribe(onNext: { ob in
        print("방출 = \(ob)")
    })
    .disposed(by: disposeBag)

first.onNext(1)
first.onNext(2)
second.onNext(2)
second.onNext(3)
second.onNext(4)

/*:
 CombineLatest는 두개의 이벤트가 만나서 합쳐진 경우에 방출하는 오퍼레이터 입니다.
 이후에 설명할 merge및 zip과 헷갈릴 수 있는데, '처음에 합쳐지기 전(first, second) 에 방출되지 않지만 이후에는 하나씩(first 또는 second만) 들어오더라도 방출된다' 라고 이해하시면 되겠습니다.
 
 [Next](WithLatestFrom)
 */
