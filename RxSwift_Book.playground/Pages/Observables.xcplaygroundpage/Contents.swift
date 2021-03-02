import RxSwift
/*:
 [Previous](RxSwift%20Components)
 
 # Observables
 
 Observable에 대한 간단한 특징을 먼저 알아봅시다.
 
 * Observable은 이벤트 시퀀스를 생성하고 발생시키는 기능을 가지고 있으며, 이렇게 발생한 이벤트들은 인스턴스나 탭과같은 제스처를 인식할 수도 있습니다.
 
 * 여기서 말하는 시퀀스는 데이터 타입을 의미하고 데이터 타입은 이전에 말했던 인스턴스나, String, Int 등 모두를 의미합니다.
 
 * Subscribe를 통해서 옵저버와 연결시킨 뒤 이벤트가 발생하면 기대값에 따라 onNext, onError, onCompleted 항목을 파라미터로 전달받습니다.
 
 * 생성과 동시에 이벤트를 방출하기 시작하는 Hot Observable과 Subscribe되는 시점부터 이벤트를 방출하는 Cold Observable로 나뉘어집니다.
 
 [Next](Operators)
 */
