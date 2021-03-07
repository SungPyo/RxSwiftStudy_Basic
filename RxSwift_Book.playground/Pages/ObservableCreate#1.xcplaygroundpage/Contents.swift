import RxSwift
/*:
 [Previous](ObservableCreate#1)
 
 # create, just, of, from
 */
let createObservable: Observable<Int> = Observable.create { observer -> Disposable in
   observer.onNext(1)
   return Disposables.create()
}
let justObservable: Observable<Int> = Observable.just(1)
let ofObservable: Observable<Int> = Observable.of(1)
let ofsObservable: Observable<[Int]> = Observable.of([1,2,3,4,5])
let fromObservable: Observable<Int> = Observable.from([1,2,3])
/*:
 코드로 보셨을때 이해가 가시나요?

 create는 Observable을 자유롭게 생성 할 수 있는 일반적인 메소드이며, just는 오로지 하나의 요소만을 포함하는 메소드 입니다.

 of와 ofs의 경우 헷갈리실 수 있는데, 타입을 미리 정해놓으면 주어진 값에 대해서 뭐든지 생성이 가능한 메소드 입니다.

 from의 경우는 array의 요소를 통해서 observable을 생성하는 메소드 입니다.
 
 다음은 subscribe에 대해서 알아보죠!
 
 [Next](Subscribe)
 */
