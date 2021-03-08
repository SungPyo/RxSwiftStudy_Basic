import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](BehaviorSubject)
 # ReplaySubject

 ReplaySubject 기존의 PublishSubject나 BegaviorSubject와 전혀 다르다고 생각하실 수 있는데요.
 
 초기화시 가지고 있는 버퍼의 사이즈만큼을 최신의 이벤트를 가지고 있다가 subscribe를 시작함과 동시에 가지고 있는
 
 모든 element를 방출합니다. 물론 버퍼 사이즈를 무제한으로 늘려놓을 수 있는데, 이런경우 메모리 이슈에 신경써야 합니다.
 
 헷갈리실 수 있으니 샘플 코드와 함께 보시죠 :)
 */
let replaySubject: ReplaySubject<String> = ReplaySubject<String>.create(bufferSize: 2)
let unboundedReplaySubject: ReplaySubject<String> = ReplaySubject<String>.createUnbounded()

replaySubject.onNext("1")
replaySubject.onNext("2")
replaySubject.onNext("3")
replaySubject.onNext("4")
replaySubject.subscribe { e in
    print("a = \(e)")
}.disposed(by: disposeBag)
let error: NSError = NSError(domain: "error", code: 0, userInfo: nil)
replaySubject.onNext("5")
replaySubject.onNext("6")
replaySubject.onError(error)
replaySubject.subscribe { e in
    print("b = \(e)") //에러를 방출하여 종료했다 하더라도 버퍼에 쌓여있는 값이므로 방출!
}.disposed(by: disposeBag)
/*:
 [Next](BehaviorRelay)
 */
