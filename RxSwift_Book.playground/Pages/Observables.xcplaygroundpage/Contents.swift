import RxSwift
/*:
 [Previous](@previous)
 
 # Observables
 
 Observable에 대한 간단한 특징을 먼저 알아봅시다.
 
 * Observable은 이벤트 시퀀스를 생성하고 발생시키는 기능을 가지고 있으며, 이렇게 발생한 이벤트들은 인스턴스나 탭과같은 제스처를 인식할 수도 있습니다.
 
 * 여기서 말하는 시퀀스는 데이터 타입을 의미하고 데이터 타입은 이전에 말했던 인스턴스나, String, Int 등 모두를 의미합니다.
 
 * Subscribe를 통해서 옵저버와 연결시킨 뒤 이벤트가 발생하면 기대값에 따라 onNext, onError, onCompleted 항목을 파라미터로 전달받습니다.
 
 * 생성과 동시에 이벤트를 방출하기 시작하는 Hot Observable과 Subscribe되는 시점부터 이벤트를 방출하는 Cold Observable로 나뉘어집니다.
 
 Observable을 생성하는 방법에 대해서 여러가지가 있는데요. create, just, of, from에 대해서 코드를 보면서 이해해보죠!
 
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
 
 이렇게 간단하게 Observable에 대해서 알아봤는데 다음장은 자주 사용하는 몇가지의 Operator에 대해서 알아보도록 하쥬!
 
 [Next](@next)
 */
