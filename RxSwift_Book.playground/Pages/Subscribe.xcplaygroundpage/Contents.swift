import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](ObservableCreate#1)
 # Subscribe

 Rx를 배우다 보면 'Subscribe' 이라는 단어를 많이 접하실텐데요.
 
 Subscribe는 Observable의 반환 이벤트에따라 즉각적으로 동작하는 메소드 입니다.
 
 Observer가 Observable에서 방출되는 이벤트를 받으려면 Subscribe를 사용해야 합니다.
 
 방출되는 이벤트는 [마블다이어그램](MarbleUnderstand) 에서 설명드린 3개의 이벤트입니다.
 
 [공식 문서](http://reactivex.io/documentation/ko/operators/subscribe.html)에 보면 Subscribe도 Operator로 표현되어 있습니다.
  
 Subscribe 설명에도 Hot Observable과 Cold Observable에 대한 내용이 있는데 이전 Observable설명에서 잊으신 분들은 다시한번 [리마인드](Observables)
 
 사용방법에 대한 간단한 예제를 하나 볼까요?
 */
//첫번째
Observable<Int>.of(1,2,3,4,5).asObservable()
    .subscribe { event in
        print("event = \(event)")
    }
    .disposed(by: disposeBag)

//두번째
Observable<Int>.create { (observer) -> Disposable in
    let error = NSError(domain: "Error입니다.", code: 0, userInfo: nil)
    observer.onNext(1)
    observer.onError(error)
    return Disposables.create()
}
.subscribe { event in
    print("event = \(event)")
}
.disposed(by: disposeBag)
/*:
 어때요 참 쉽죠?
 
 첫번째 예제의 경우 1,2,3,4,5 를 방출(onNext)한 후 모두 다 방출된 이후 completed 를 방출하고 스트림이 끝난걸 볼 수 있구요
 
 두번째 예제의 경우 onNext 이벤트로 1이 방출된 후 error 이벤트 방출로 인해 스트림이 종료되는걸 볼 수 있습니다.
 
 Subscribe는 RxSwift를 사용하시면서 많이 사용되는 부분이니 꼭 알고 넘어가셔야 합니다! 다음은 dispose에 대해서 알아볼게요.
 
 [Next](Dispose)
 */
