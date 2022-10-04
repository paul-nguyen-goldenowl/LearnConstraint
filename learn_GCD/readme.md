## Queue

- `Main Queue` 
    + Thực thi trên main thread
    + Là 1 serial queue

- `Global Queue`
    + Là concurrent queue
    + Chia sẻ trên toàn bộ hệ thống
    + Có 4 mức độ ưu tiên: high, default, low, background

- `Custom Queue`
    + Có thể tạo ra là 1 serial hay concurrent queue

## Usages

- `Main Queue` : Là sự lựa chọn phổ biến cho việc update UI sau khi hoàn thành task. Mọi thứ với main thì phải là bất động bộ (async)
- `Global Queue` : Là sự lựa chọn tốt cho các công việc không phải UI và thực thi ở backgrounds
- `Custom Serial Queue` : Là sự lựa chọn tốt nhất cho việc thực hiện ở background và cần theo dõi chúng. Tránh bị chiếm tài nguyên hệ thống. Dùng nhiều trong việc load data.

## Concurent + activate
```swift
let queue = DispatchQueue(label: "myqueue", qos: .utility, attributes: [.initiallyInactive, .concurrent])
```

## Background Task
```swift
class ViewController: UIViewController {
    
    var myImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImage = UIImageView()
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }

            let compressedImage = self.compressImage()

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.myImage?.image = compressedImage
            }
            
        }
    }
    
    func compressImage() -> UIImage? {
        return nil
    }
}
```

## Delay task
```swift
let queue = DispatchQueue(label: "myqueue", qos: .userInitiated)
print(Date())
let additionalTime: DispatchTimeInterval = .seconds(2)
queue.asyncAfter(deadline: .now() + additionalTime) {
    print(Date())
}
```

## workItem
```swift
var value = 10
let workItem = DispatchWorkItem {
    value += 5
}
workItem.perform()
let queue = DispatchQueue.global()
queue.async(execute: workItem)
workItem.notify(queue: DispatchQueue.main) {
    print(value)
}
```

## Dispatch group
```swift
DispatchQueue.global(qos: .userInitiated).async {

    let dispatchGroup = DispatchGroup()
    
    dispatchGroup.enter()
    self.taskOne {
        print("ONE -> DONE")
        dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    self.taskTwo {
        print("TWO -> DONE")
        dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    self.taskThree {
        print("THREE -> DONE")
        dispatchGroup.leave()
    }
    
    dispatchGroup.wait()
    
    dispatchGroup.notify(queue: .main) {
        print("ALL DONE")
    }
}
```


## Links

[https://fxstudio.dev/grand-central-dispatch-managing-task/](https://fxstudio.dev/grand-central-dispatch-managing-task/)

[https://gist.github.com/tclementdev/6af616354912b0347cdf6db159c37057](https://gist.github.com/tclementdev/6af616354912b0347cdf6db159c37057)