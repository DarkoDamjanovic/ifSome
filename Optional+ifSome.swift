
public extension Optional {
    func ifSome(f: (Wrapped) throws -> Void) rethrows {
        if case .some(let unwrapped) = self {
            try f(unwrapped)
        }
    }
    
    func ifNone(f: () throws -> Void) rethrows {
        if case .none = self {
            try f()
        }
    }
}
