import Foundation
/*:
 [Previous](@previous)
 
 # Asynchronous Programming
 
 ReactiveX 와 RxSwift에 대해 어느정도 알아보았으니, 이제 비동기 프로그래밍에 대해 알아봅시다.
 
 비동기 프로그래밍은 어떠한 동작(예: 함수)의 결과를 기다리지 않고 별도의 스레드에 작업을 맡긴 뒤 바로 다음 작업을 실행하는 병렬처리 방식입니다.
 
 익숙한 형태의 코드를 한번 볼까요?
 */
func request(completion: @escaping (Result<String, Error>) -> ()) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
        completion(.success("success"))
    }
}

print("함수 요청 전\(Thread.isMainThread)")
request { _ in
    print("비동기 처리 완료! \(Thread.isMainThread)")
}
print("함수의 결과를 기다리지 않고 처리\(Thread.isMainThread)")
/*:
 위와같이 우리가 많이 사용하는 비동기 프로그래밍에는 무거운 작업이나(이미지 변환), API호출 등이 있습니다.
 
 비동기 프로그래밍을 공부하실때 동시성 프로그래밍과 병렬성 프로그래밍과 함께 생각하여 헷갈리시는 분들이 종종 계시지만
 
 비동기 프로그래밍은 스레드의 결과 처리를 다른 스레드에게 맡기고 남은 작업을 이어서 처리하는 병렬 처리방식 인 것이며,
 
 병렬성 프로그래밍 방식 이라고 보시면 됩니다. 병렬성 프로그래밍은 동시성 프로그래밍과 차이가 존재하는데,
 
 동시성 프로그래밍은 동시에 실행되는 것 처럼 보이지만 실제로는 여러개의 스레드가 매우 빠른 시간으로 번갈아 가면서 실행되는 프로그래밍 방식입니다.
 
 [Next](@next)
 */
