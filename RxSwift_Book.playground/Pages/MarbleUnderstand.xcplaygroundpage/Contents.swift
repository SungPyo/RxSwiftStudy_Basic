/*:
 [Previous](ObservableLifeCycle)
 
 # 마블 다이어그램
 
 우리가 Rx를 하다보면 아래와 같은 사진들을 많이 접하게 되는데요, 이러한 모양을 마블 다이어그램이라고 합니다.
 
 ![](marble1.png)
 
 내용에 대해서 설명을 한번 해볼까요?
 
 가운데에 있는 검정색 선은 시간의 흐름을 나타냅니다.
 
 그리고 1,2,3 은 각각의 시퀀스를 나타내는데 방출된 onNext이벤트 라고 생각하시면 됩니다.
 
 조금 다른 그림을 볼까요?
 
 ![](marble2.png)
 
 위 그림은 끝에 | 표시가 있죠? 이 표시는 completed 이벤트에 해당되며 completed 이벤트가 발생되면 흐름이 종료되며 더이상 이벤트가 발생하지 않습니다.
 
 또 다른 그림을 볼까요?
 
 ![](marble3.png)
 
 X 표시의 경우는 error 이벤트가 발생했다는 건데, error 이벤트의 경우에도 똑같이 흐름이 종료되며, 더이상 이벤트가 발생하지 않습니다.
 
 이제 마블이 조금 이해가 가시나요?
 
 오퍼레이터 설명도 이러한 마블로 이루어져 있는데 [여기에서](https://rxmarbles.com/) 많은 오퍼레이터를 확인하실 수 있습니다.
 
 [Next](ObservableCreate)
 */