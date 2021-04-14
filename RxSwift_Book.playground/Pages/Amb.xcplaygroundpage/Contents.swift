import RxSwift
let disposeBag: DisposeBag = DisposeBag()
/*:
 [Previous](Concat)
 
 # Amb
 */
let first = PublishSubject<Int>()
let second = PublishSubject<Int>()

let concatObservable = Observable.amb([first,second])

concatObservable
    .subscribe(onNext: { ob in
        print("방출 = \(ob)")
    })
    .disposed(by: disposeBag)

second.onNext(5)
first.onNext(1)
first.onNext(2)
second.onNext(6)
first.onNext(3)
second.onNext(7)
second.onNext(8)

/*:
 Amb는 맨 처음 발생한 Observable의 이벤트만 사용합니다.
 
 [Next](StartWith)
 */

func loadList() -> Observable<[String]> {
    print("Thread.isMainThread = \(Thread.isMainThread)")
    return Observable.just(["1","2","3"])
}
DispatchQueue.global().async {
    let todoObservable: Observable<[String]> = loadList()

    todoObservable
        // 2. observable을 background에서 생성.
        .subscribe(on: MainScheduler.instance)
//        .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default))
        // 3. 이후부터는 main에서 처리하도록 함.
        .observe(on: MainScheduler.asyncInstance)
        .subscribe(onNext: { todoList in
            print("Todo: \(todoList)")
        })
        .disposed(by: disposeBag)
}
