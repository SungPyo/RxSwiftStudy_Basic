import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Sample)
 
 # Skip
 */
let skipObservable: Observable = Observable.from([1,2,3,4,5])

skipObservable
    .skip(2)
    .subscribe(onNext: { number in
        print("방출 = \(number)")
    })
    .disposed(by: disposeBag)

/*:
 skip의 count만큼 'skip' 합니다.
 
 [Next](SkipWhile)
 */
