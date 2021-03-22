import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](CombineLatest)
 
 # WithLatestFrom
 */
let first = PublishSubject<String>()
let second = PublishSubject<Int>()

first
    .withLatestFrom(second, resultSelector: { (str, int) in
        "\(str) \(int)"
    })
    .subscribe(onNext: { ob in
        print("방출 = \(ob)")
    })
    .disposed(by: disposeBag)

first.onNext("a") //second가 없음. 무시
first.onNext("b") //second가 없음. 무시
second.onNext(3)  //second가 들어옴.
first.onNext("c") //first가 들어옴! 가장 최근에 들어온 second와 함께 방출 c3
second.onNext(4) //second가 들어옴.
second.onNext(6) //second가 들어옴.
first.onNext("d") //first가 들어옴! 가장 최근에 들어온 second와 함께 방출 d6
first.onNext("dd") //first가 들어옴! 가장 최근에 들어온 second와 함께 방출 dd6
second.onNext(5) //second가 들어옴.
first.onNext("e") //first가 들어옴! 가장 최근에 들어온 second와 함께 방출 e5

/*:
 WithLatestFrom은 이전에 봤던 combine과 많이 혼동할 수 있는데요! 똑같이 이벤트가 둘 다 들어와야 방출하는건 맞지만
 첫번째 옵저버블에서 이벤트가 방출되었을때, 두번째 옵저버블의 가장 최근 이벤트와 합성하는 차이가 있습니다. combine은 그냥 바로바로 합성해버리는데, 그 부분에 차이가 있다고 보면 될 것 같네요.
 
 [Next](Merge)
 */
