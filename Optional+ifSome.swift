
public extension Optional {
    public func ifSome(@noescape f: (Wrapped) throws -> Void) rethrows {
        if case .Some(let unwrapped) = self {
            try f(unwrapped)
        }
    }
}
