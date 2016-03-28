
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
