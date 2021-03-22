import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](SwitchLatest)
 
 # Zip
 */
let first = PublishSubject<Int>()
let second = PublishSubject<String>()
let zipObservable = Observable.zip(first, second)

zipObservable
    .subscribe(onNext: { ob in
        print("방출 = \(ob)")
    })
    .disposed(by: disposeBag)

first.onNext(1)
first.onNext(2)
second.onNext("a")
second.onNext("b")
second.onNext("c")

/*:
 zip도 combineLastest와 마찬가지로 는 두개의 이벤트가 만나서 합쳐진 경우에 방출하는 오퍼레이터 입니다.
 단, 무조건 두개의 이벤트가 쌍을 이뤄야만 방출되며, 순서 또한 동일한 경우에만 방출됩니다.
 
 [Next](Concat)
 */
