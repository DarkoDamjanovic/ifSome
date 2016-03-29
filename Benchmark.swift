import Foundation

public extension Optional {
    public func ifSome(@noescape f: (Wrapped) throws -> Void) rethrows {
        if case .Some(let unwrapped) = self {
            try f(unwrapped)
        }
    }
    
    public func ifNone(@noescape f: Void throws -> Void) rethrows {
        if case .None = self {
            try f()
        }
    }
}

let testCount = 1_00_000_000
var array = [Int?]()
array.reserveCapacity(testCount)

for i in 0..<testCount {
    if i % 2 == 0 {
       array.append(nil)
    } else {
       array.append(i)
    }
}

var sum = 0
var start = NSDate()

for i in array {
    i.ifSome {
        sum = sum + $0
    }
}

var end = NSDate()
var interval = end.timeIntervalSinceDate(start)
print("Duration ifSome: \(interval)")

sum = 0
start = NSDate()

for i in array {
    if let i = i {
        sum = sum + i
    }
}

end = NSDate()
interval = end.timeIntervalSinceDate(start)
print("Duration if let: \(interval)")

sum = 0
start = NSDate()

for i in array {
    if var i = i {
        sum = sum + i
    }
}

end = NSDate()
interval = end.timeIntervalSinceDate(start)
print("Duration if var: \(interval)")













