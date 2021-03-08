/*:
 [Previous](Subscribe)
 # Dispose
 
 Observable은 Subscribe을 호출하기 이전까지 아무일도 하지 않습니다.
 
 Subscribe을 호출해야 이벤트가 발생했을때 Observable이 이벤트를 발생시키고 error 또는 completed가 호출되기 이전까지 계속해서 next 이벤트를 발생시킵니다.
 
 이러한 Subscribe를 중단시키는 방법이 dispose입니다.
 
 dispose를 호출하게 되면 Observable은 더이상 이벤트를 발생시키지 않습니다.
 
 하지만 생성하는 Observable마다 dispose를 전부 다 관리하는건 과거에 retain relase하듯 매우 힘든 일이겠죠?
 
 그래서 사용하는것이 disposeBag 입니다.
 
 disposeBag에 대해서도 한번 알아보시죠 :)
 
 [Next](DisposeBag)
 */
