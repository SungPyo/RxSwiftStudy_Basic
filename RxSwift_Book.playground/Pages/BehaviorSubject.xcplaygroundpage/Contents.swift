import RxSwift
/*:
 [Previous](PublishSubject)
 # BehaviorSubject

 BehaviorSubject는 PublishSubject와 약간 다르게 초기값을 가지고 있습니다.
 
 그렇기에 subscribe하는 순간 바로 가지고 있던 초기값을 방출하게 됩니다.
 
 주로 구독된 순간 초기값의 이벤트를 바로 받아 처리해야 할 때 사용합니다.
 */
let behaviorSubject: BehaviorSubject<String> = BehaviorSubject<String>(value: "init")
/*:
 [Next](ReplaySubject)
 */
