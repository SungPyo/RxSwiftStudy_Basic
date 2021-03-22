import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](First)
 
 # IgnoreElements
 */
let error = NSError(domain: "", code: 0, userInfo: nil)
let ignoreElementsObservable: Observable = Observable<Error>.error(error)

ignoreElementsObservable
    .ignoreElements()
    .subscribe(onNext: { number in
        print("number = \(number)")
    }, onError: { error in
        print("error = \(error)")
    }, onCompleted: {
        print("onCompleted")
    }, onDisposed: {
        print("onDisposed")
    })
    .disposed(by: disposeBag)

/*:
 이벤트를 방출하지 않고 성공또는 에러 여부만 알려줍니다.
 
 [Next](Sample)
 */
