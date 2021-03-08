/*:
 [Previous](Dispose)
 # Dispose

 disposeBag은 Disposable타입을 담을 수 있는 클래스이고, Disposable에서 disposed(by:) 메소드를 이용해서 disposeBag에 Disposable을 담을 수 있습니다.
 
 그리고 이 disposeBag은 dealloc될때 내부에 있는 Disposable을 같이 dealloc 시킵니다.
 
 이걸 왜 해야하는가? 라는 질문이 있을 수 있는데요.
 
 해당 Observable에 대해서 dispose시키지 않은경우에 메모리 릭이 발생할 수 있습니다.
 
 물론 현재의 swift는 컴파일러가 warning을 알려주기때문에 dispose를 깜빡하는 경우는 아마 없을거라고 예상되네요 :)
 
 리턴타입이 Disposable라면! disposeBag에 담아야 한다! 라고 생각하시면 될 것 같아요!
 
 이제 종류별 Subject에 대해서 알아볼까요?
 
 [Next](PublishSubject)
 */
