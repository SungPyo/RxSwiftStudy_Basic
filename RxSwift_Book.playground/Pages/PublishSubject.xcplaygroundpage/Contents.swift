import RxSwift
/*:
 [Previous](DisposeBag)
 # PublishSubject

 PublishSubject는 가장 기본적인 형태의 서브젝트인데요.
 
 초기값이 존재하지 않고 새로운 값을 전달받을때 마다 subscriber를 통해서 방출하는 서브젝트 입니다.
 
 주로 새로운 이벤트를 받아서 사용합니다.
 */
let publishSubject: PublishSubject<String> = PublishSubject<String>()
/*:
 [Next](BehaviorSubject)
 */
