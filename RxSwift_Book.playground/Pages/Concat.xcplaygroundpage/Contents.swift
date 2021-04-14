import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Zip)
 
 # Concat
 */
let first = PublishSubject<Int>()
let second = PublishSubject<Int>()

let concatObservable = Observable.concat(first,second)

concatObservable
    .subscribe(onNext: { ob in
        print("방출 = \(ob)")
    }, onCompleted: {
        print("c")
    })
    .disposed(by: disposeBag)

first.onNext(1)
first.onNext(2)
second.onNext(1)
first.onNext(3)
first.onCompleted()
second.onNext(2)
second.onNext(3)
second.onNext(4)

/*:
 concat은 들어온 Observable들을 직렬로 연결시킨다고 생각하면 됩니다.
 순서대로 Observable들이 Completed가 되면 다음 Observable의 이벤트들을 방출합니다.
 
 [Next](Amb)
 */
