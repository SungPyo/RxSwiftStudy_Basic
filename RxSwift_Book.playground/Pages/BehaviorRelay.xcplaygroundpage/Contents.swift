import RxSwift
import RxRelay
/*:
 [Previous](ReplaySubject)
 # Relay

 기본적으로 모든 Relay는 Subject의 Wrapper 클래스이며, PushblishRelay와 BehaviorRelay가 존재합니다.
 
 Subject와의 차이점으로는 Subject의 경우는 completed 또는 error 가 발생할 경우 이벤트 스트림이 종료되지만, Relay의 경우는 dispose되기 전까지 계속 작동하기 때문에 UI환경에서 사용하기 좋습니다.
 
 PushblishRelay는 PushblishSubject와의 차이점으로 Subject냐 Relay냐의 차이점 외에 다른 차이점은 존재하지 않습니다. 구독 이후의 이벤트만 알 수 있는것도 같구요 :)
 
 BehaviorRelay의 경우는 .value를 통해서 현재의 값을 가져올 수 있는 기능이 있습니다!
 
 value의 경우에는 기존에 variable이 있었지만 variable이 Deprecated되고 BehaviorRelay사용을 권장하기 때문에 variable대신에 사용하시면 됩니다.
 
 BehaviorSubject 또한 value()라는 함수로 값을 가져올 수 있으나, Subject와 Relay의 특성 때문에 try를 써야 하는 단점과 위험(?) 이 있어서 BehaviorSubject를 사용한 적은 없었던것 같네요 :)
 
 고생하셨습니다(?)
 */
let behaviorRelay: BehaviorRelay<String> = BehaviorRelay<String>(value: "init")
let publishRelay: PublishRelay<String> = PublishRelay<String>()
print(behaviorRelay.value)
/*:
 [Next](RxSwiftStudy)
 */
